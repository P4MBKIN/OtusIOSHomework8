//
//  ContentViewModel.swift
//  HomeWork8
//
//  Created by Pavel Antonov on 21.02.2020.
//  Copyright © 2020 OtusCourse. All rights reserved.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Published var sharedText: String = "Text" {
        didSet {
            print("tuturu")
        }
    }
    @Published var outputText: String = "Text"
    @Published var selectedIndex: Int = 0 {
        didSet {
            print(selectedIndex)
        }
    }
    @Published var languages: [String] = ["en-US", "fr", "zh"]
    
    private let suiteName: String = "group.OtusCourse.HomeWork8"
    
    init() {
        getTextFromUserDefaults(suiteName: suiteName)
    }
    
    private func getTextFromUserDefaults(suiteName: String) {
        if let prefs = UserDefaults(suiteName: suiteName) {
            sharedText = prefs.string(forKey: "String") ?? "Text"
            prefs.removeObject(forKey: "String")
        }
    }
}
