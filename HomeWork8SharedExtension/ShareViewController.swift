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

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.

        if let contentMessage = contentText, contentMessage.isContainDate() {
            self.extensionContext!.completeRequest(returningItems: [contentMessage], completionHandler: nil)
            
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
}
