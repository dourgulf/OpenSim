//
//  OpenIM5DatabaseAction.swift
//  OpenSim
//
//  Created by lidawen on 2021/7/2.
//  Copyright © 2021 Luo Sheng. All rights reserved.
//

import Cocoa

class OpenIM5DatabaseAction: ExtraApplicationActionable {
    var envType: String = ""

    var title: String = UIConstants.strings.extensionOpenIM5Database

    let appBundleIdentifier = "net.sourceforge.sqlitebrowser"

    var application: Application?

    var isAvailable: Bool {
        return applicationUrl != nil && hasDatabase
    }

    func perform() {
        let databaseUrls = checkDatabase()
        if databaseUrls.count > 0 {
            var selectedUrl = databaseUrls.first!
            if databaseUrls.count > 1 {
                let alert: NSAlert = NSAlert()
                alert.messageText = UIConstants.strings.alertMultipleIM5Database
                alert.alertStyle = .informational
                for url in databaseUrls {
                    let path = url.path
                    // find the account parts
                    let parts = path.components(separatedBy: "/")
                    if parts.count >= 2 {
                        let account = parts[parts.endIndex-2]
                        alert.addButton(withTitle: account)
                    }
                }
                let index = alert.runModal().rawValue - NSApplication.ModalResponse.alertFirstButtonReturn.rawValue
                if index >= 0 && index < databaseUrls.count {
                    selectedUrl = databaseUrls[index];
                }
            }
            openDatabase(url: selectedUrl)
        }
    }
    
    func openDatabase(url: URL) {
        if let appUrl = applicationUrl {
            do {
                try NSWorkspace.shared.open([url], withApplicationAt: appUrl, options: .default, configuration: [:])
            } catch {
                print("\(error)")
                let alert: NSAlert = NSAlert()
                alert.messageText = "UIConstants.strings.extensionOpenIM5Database \(error)"
                alert.alertStyle = .critical
                alert.addButton(withTitle: "OK")
                alert.runModal()
            }
        }
    }

    required init(application: Application) {
        self.application = application
    }

    func setupType(_ type: String) {
        envType = type
        title = "\(UIConstants.strings.extensionOpenIM5Database) [\(envType)]"
        hasDatabase = checkDatabase().count > 0
    }

    var hasDatabase: Bool = false

    func checkDatabase() -> [URL] {
        var resultPath: [URL] = []
        if let sandboxUrl = application?.sandboxUrl {
            let subtypePath = "Documents/\(envType)"
            let IM5path = sandboxUrl.appendingPathComponent(subtypePath)
            let sandboxPath = sandboxUrl.path
            if let enumerator = FileManager.default.enumerator(at: IM5path, includingPropertiesForKeys: nil) {
                while let fileUrl = enumerator.nextObject() as? URL {
                    if fileUrl.lastPathComponent == "im5db" {
                        let filePath = fileUrl.path
                        let simplePathIndex = filePath.index(filePath.startIndex, offsetBy: sandboxPath.count)
                        print("find im5db:\(filePath[simplePathIndex...])")
                        resultPath.append(fileUrl)
                    }
                }
            }
        }
        return resultPath
    }
}

class OpenIM5DatabaseGlobalAction: OpenIM5DatabaseAction {
    required init(application: Application) {
        super.init(application: application)
        setupType("IM5")
    }
}

class OpenIM5DatabaseCNAction: OpenIM5DatabaseAction {
    required init(application: Application) {
        super.init(application: application)
        setupType("IM5_CN")
    }
}

class OpenIM5DatabaseUSAction: OpenIM5DatabaseAction {
    required init(application: Application) {
        super.init(application: application)
        setupType("IM5_US")
    }
}

class OpenIM5DatabaseDevAction: OpenIM5DatabaseAction {
    required init(application: Application) {
        super.init(application: application)
        setupType("IM5_Dev")
    }
}
