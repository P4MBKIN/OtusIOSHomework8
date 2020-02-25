//
//  ContentViewModel.swift
//  HomeWork8
//
//  Created by Pavel Antonov on 21.02.2020.
//  Copyright © 2020 OtusCourse. All rights reserved.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Published var sharedText: String = "Your shared text (time: ISO 8601 in format: yyyy-MM-dd'T'HH:mm:ss or ...)"
    @Published var outputText: String = "Your analyzed text in selected language"
    @Published var selectedIndex: Int = 0 {
        didSet {
            print(selectedIndex)
        }
    }
    @Published var languages: [String] = ["en-US", "fr", "zh"]
}
