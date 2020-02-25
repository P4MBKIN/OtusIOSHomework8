//
//  ContentView.swift
//  HomeWork8
//
//  Created by Pavel Antonov on 21.02.2020.
//  Copyright © 2020 OtusCourse. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var vm: ContentViewModel
    
    var body: some View {
        VStack {
            Picker("Picker", selection: $vm.selectedIndex) {
                ForEach(0..<vm.languages.count) { index in
                    Text(self.vm.languages[index])
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            Spacer()
            Text(vm.sharedText).font(.headline).foregroundColor(.orange)
            Spacer()
            Text(vm.outputText).font(.body)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ContentViewModel())
    }
}
