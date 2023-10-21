//
//  RevealInFinderAction.swift
//  OpenSim
//
//  Created by Luo Sheng on 07/05/2017.
//  Copyright © 2017 Luo Sheng. All rights reserved.
//

import Cocoa

class RevealInFinderAction: ApplicationActionable {
    
    var application: Application?
    
    var title: String { UIConstants.strings.actionRevealInFinder }
    
    let icon = templatize(#imageLiteral(resourceName: "reveal"))
    
    let isAvailable: Bool = true
    
    required init(application: Application) {
        self.application = application
    }
    
    func perform() {
        if let url = application?.sandboxUrl {
            NSWorkspace.shared.open(url)
        }
    }
    
}

class RRevealAppGroupsInFinderAction: RevealInFinderAction {
    override var title: String { UIConstants.strings.actionRevealAppGroupsInFinder }
    override func perform() {
        if let url = application?.URLForAppGroups("group.test.appgroups") {
            NSWorkspace.shared.open(url)
        }
    }
}
