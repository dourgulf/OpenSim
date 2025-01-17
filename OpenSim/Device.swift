//
//  Device.swift
//  SimPholders
//
//  Created by Luo Sheng on 11/9/15.
//  Copyright © 2015 Luo Sheng. All rights reserved.
//

import Foundation

enum State {
    case shutdown
    case booted
    case unknown
}

struct Device {
    private let stateValue: String
    public let name: String
    public let UDID: String
}

extension Device {
    public var applications: [Application]? {
        let applicationPath = URLHelper.deviceURLForUDID(self.UDID).appendingPathComponent("data/Containers/Bundle/Application")
        let contents = try? FileManager.default.contentsOfDirectory(at: applicationPath, includingPropertiesForKeys: [.isDirectoryKey], options: [.skipsSubdirectoryDescendants, .skipsHiddenFiles])
            return contents?
                .filter({ (url) -> Bool in
                    var isDirectoryObj: AnyObject?
                    try? (url as NSURL).getResourceValue(&isDirectoryObj, forKey: URLResourceKey.isDirectoryKey)
                    guard let isDirectory = isDirectoryObj as? Bool else {
                        return false
                    }
                    return isDirectory
                })
                .map { Application(device: self, url: $0) }
                .filter { $0 != nil }
                .map { $0! }
    }
    
    public var state: State {
        switch stateValue {
        case "Booted":
            return .booted
        case "Shutdown":
            return .shutdown
        default:
            return .unknown
        }
    }
    
    fileprivate func URLForIdentifier(_ id: String, base URL: URL) -> URL? {
        let directories = try? FileManager.default.contentsOfDirectory(at: URL, includingPropertiesForKeys: nil, options: .skipsSubdirectoryDescendants)
        return directories?.filter({ (dir) -> Bool in
            guard let contents = NSDictionary(contentsOf: dir.appendingPathComponent(".com.apple.mobile_container_manager.metadata.plist"))
            else {
                return false
            }
            guard let identifier = contents["MCMMetadataIdentifier"] as? String
            else {
                return false
            }
            return identifier == id
        }).first
    }
    
    public func containerURLForApplication(_ application: Application) -> URL? {
        let contianerURL = URLHelper.containersURLForUDID(UDID)
        return URLForIdentifier(application.bundleID, base: contianerURL)
    }
    
    public func URLForAppGroups(_ group: String, application: Application) -> URL? {
        let appGroupsURL = URLHelper.appGroupsURLForUDID(UDID)
        return URLForIdentifier(group, base: appGroupsURL)
    }
    
    func launch() {
        if state != .booted {
            SimulatorController.boot(self)
        }
        SimulatorController.open()
    }

    func shutDown() {
        if state == .booted {
            SimulatorController.shutdown(self)
        }
    }

    func factoryReset() {
        if state != .shutdown {
            SimulatorController.shutdown(self)
        }
        SimulatorController.factoryReset(self)
    }
}

extension Device: Decodable {
    enum CodingKeys: String, CodingKey {
        case UDID = "udid"
        case name
        case stateValue = "state"
    }
}
