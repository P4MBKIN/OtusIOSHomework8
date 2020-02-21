//
//  ContentViewModel.swift
//  HomeWork8
//
//  Created by Pavel Antonov on 21.02.2020.
//  Copyright © 2020 OtusCourse. All rights reserved.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Published var sharedText: String = "Your shared text"
    @Published var selectedIndex: Int = 0 {
        didSet {
            print(selectedIndex)
        }
    }
    @Published var languages: [String] = ["en-US", "fr", "zh"]
}
