//
//  ContentViewModel.swift
//  HomeWork8
//
//  Created by Pavel Antonov on 21.02.2020.
//  Copyright © 2020 OtusCourse. All rights reserved.
//

import SwiftUI
import HomeWork8Framework

enum LanguageApp: String {
    case en = "en_US"
    case fr = "fr"
    case zh = "zh"
}

extension LanguageApp: CaseIterable {}

class ContentViewModel: ObservableObject {
    
    @Published var sharedText: String = "Text" {
        didSet {
            updateOutputText()
        }
    }
    @Published var outputDateText: String = "Dates:"
    @Published var outputLengthText: String = "Length:"
    @Published var selectedIndex: Int = 0 {
        didSet {
            updateOutputText()
        }
    }
    @Published var languages: [String] = LanguageApp.allCases.map{ $0.rawValue }
    
    private let suiteName: String = "group.OtusCourse.HomeWork8"
    
    init() {
        getTextFromUserDefaults(suiteName: suiteName)
    }
    
    private func updateOutputText() {
        let service = LocalizerService(locale: Locale(identifier: languages[selectedIndex]))
        let dates = sharedText.parseData(regex: Regexes.date).map { service.localizeDate(from: $0) }
        let length = sharedText.parseData(regex: Regexes.length).map { service.localizeMeasurement(from: $0) }
        outputDateText = dates.reduce("Dates:") { $0 + "\n" + $1}
        outputLengthText = length.reduce("Length:") { $0 + "\n" + $1}
    }
    
    private func getTextFromUserDefaults(suiteName: String) {
        if let prefs = UserDefaults(suiteName: suiteName), let text = prefs.string(forKey: "String") {
            sharedText = text
            prefs.removeObject(forKey: "String")
        }
    }
}
