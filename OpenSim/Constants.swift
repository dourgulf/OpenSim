
import Foundation

struct UIConstants {
    
    struct strings {
        static let menuQuitButton = NSLocalizedString("Menu.Quit", comment: "Quit menu button")
        static let menuLaunchAtLoginButton = NSLocalizedString("Menu.LaunchAtLogin", comment: "Launch at login menu button")
        static let menuRefreshButton = NSLocalizedString("Menu.Refresh", comment: "Refresh menu button")
        static let menuFocusedModeButton = NSLocalizedString("Menu.FocusedMode", comment: "Focused Mode menu button")
        static let menuVersionLabel = NSLocalizedString("Menu.Version", comment: "Version label")
        static let menuLaunchSimulatorButton = NSLocalizedString("Menu.Launch", comment: "Launch")
        static let menuShutdownSimulatorButton = NSLocalizedString("Menu.Shutdown", comment: "Shutdown")
        static let menuDeleteSimulatorButton = NSLocalizedString("Menu.DeleteSimulator", comment: "Delete")
        static let menuResetSimulatorButton = NSLocalizedString("Menu.FactoryReset", comment: "Factory Reset")
        static let menuShutDownAllSimulators = NSLocalizedString("Menu.FactoryResetAll", comment: "Factory Reset All Simulators")
        static let menuShutDownAllBootedSimulators = NSLocalizedString("Menu.FactoryResetOnlyShutdown", comment: "Factory Reset Only Shutdown Simulators")
        static let actionRevealInFinder = NSLocalizedString("Action.RevealInFinder", comment: "Reveal in Finder label")
        static let actionRevealAppGroupsInFinder = NSLocalizedString("Action.RevealAppGroupsInFinder", comment: "Reveal in Finder label")
        static let actionCopyPathPasteboard = NSLocalizedString("Action.CopyPathPasteboard", comment: "Copy Sandbox path to pasteboard label")
        static let actionOpenInTerminal = NSLocalizedString("Action.OpenInTerminal", comment: "Open in Terminal label")
        static let actionLaunch = NSLocalizedString("Action.Launch", comment: "Launch label")
        static let actionUninstall = NSLocalizedString("Action.Uninstall", comment: "Uninstall label")
        static let actionUninstallAlertConfirmButton = NSLocalizedString("Action.UninstallAlertConfirmButton", comment: "Uninstall confirm button")
        static let actionUninstallAlertCancelButton = NSLocalizedString("Action.UninstallAlertCancelButton", comment: "Uninstall cancel button")
        static let actionUninstallAlertMessage = NSLocalizedString("Action.UninstallAlertMessage", comment: "Uninstall confirmation message")
        static let actionDeleteSimulatorAlertConfirmButton = NSLocalizedString("Action.EraseSimulatorAlertConfirmButton", comment: "Delete Simulator")
        static let actionDeleteSimulatorAlertCancelButton = NSLocalizedString("Action.EraseSimulatorAlertCancelButton", comment: "Cancel")
        static let actionDeleteSimulatorAlertMessage = NSLocalizedString("Action.EraseSimulatorAlertMessage", comment: "Delete Simulator confirmation message")
        static let actionFactoryResetAlertConfirmButton = NSLocalizedString("Action.FactoryResetAlertConfirmButton", comment: "Factory Reset")
        static let actionFactoryResetAlertCancelButton = NSLocalizedString("Action.FactoryResetAlertCancelButton", comment: "Cancel")
        static let actionFactoryResetAlertMessage = NSLocalizedString("Action.FactoryResetAlertMessage", comment: "Factory reset confirmation message")
        static let actionFactoryResetAllSimulatorsMessage = NSLocalizedString("Action.FactoryResetAllSimulatorsMessage", comment: "Factory Reset All Simulators")
        static let actionFactoryResetAllShutdownSimulatorsMessage = NSLocalizedString("Action.FactoryResetAllShutdownSimulatorsMessage", comment: "Factory Reset All Shutdown Simulators")
        static let extensionOpenInIterm = NSLocalizedString("Extension.OpenInIterm", comment: "Open in iTerm label")
        static let extensionOpenRealmDatabase = NSLocalizedString("Extension.OpenRealmDatabase", comment: "Open Realm Database label")
        static let extensionOpenIM5Database = NSLocalizedString("Extension.OpenIM5Database", comment: "Open IM5 Database label")
        static let appInfoVersion = NSLocalizedString("AppInfo.Version", comment: "App Info Version Label")
        static let appInfoSize = NSLocalizedString("AppInfo.Size", comment: "App Info Size Label")
        static let menuHeaderActions = NSLocalizedString("MenuHeader.Actions", comment: "Actions header label")
        static let menuHeaderExtensions = NSLocalizedString("MenuHeader.Extensions", comment: "Extensions header label")
        static let menuHeaderAppInformation = NSLocalizedString("MenuHeader.AppInformation", comment: "App Information header label")
        
        static let alertMultipleIM5Database = NSLocalizedString("Extension.MultipleIM5Database", comment: "Multiple IM5 database alert message")

    }
}
