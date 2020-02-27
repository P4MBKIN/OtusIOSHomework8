//
//  ShareViewController.swift
//  HomeWork8SharedExtension
//
//  Created by Pavel Antonov on 21.02.2020.
//  Copyright © 2020 OtusCourse. All rights reserved.
//

import UIKit
import Social
import HomeWork8Framework

class ShareViewController: SLComposeServiceViewController {
    
    private let suiteName: String = "group.OtusCourse.HomeWork8"

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.

        if let contentMessage = contentText, (contentMessage.isContain(regex: Regexes.date) || contentMessage.isContain(regex: Regexes.length)) {
            saveTextToUserDefaults(suiteName: suiteName, dataString: contentMessage)
            runApp()
        } else {
            let alert = UIAlertController(title: "Extension alert", message: "Shared data not contain date", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }
    
    private func saveTextToUserDefaults(suiteName: String, dataString: String) {
        if let prefs = UserDefaults(suiteName: suiteName) {
            prefs.removeObject(forKey: "String")
            prefs.set(dataString, forKey: "String")
        }
    }
    
    private func runApp() {
        guard let url = URL(string: "HomeWork8Url://") else { return }

        let selectorOpenURL = sel_registerName("openURL:")
        var responder: UIResponder? = self

        while responder != nil {
            if responder?.responds(to: selectorOpenURL) == true {
                self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
                responder?.perform(selectorOpenURL, with: url)
            }
            responder = responder?.next
        }
    }
}
