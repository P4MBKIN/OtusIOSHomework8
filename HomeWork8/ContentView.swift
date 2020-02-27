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
            Text("Hint: time: ISO 8601 in format: yyyy-MM-dd'T'HH:mm:ss or length in kilometers in format decimal number").font(.headline).foregroundColor(.orange)
            Spacer()
            VStack {
                Text("Your shared text:").font(.headline).foregroundColor(.orange)
                Text(vm.sharedText).font(.headline).foregroundColor(.gray)
            }
            Spacer()
            VStack {
                Text("Your analyzed text in selected language:").font(.headline).foregroundColor(.orange)
                Text(vm.outputDateText).font(.headline).foregroundColor(.gray).multilineTextAlignment(.center)
                Text(vm.outputLengthText).font(.headline).foregroundColor(.gray).multilineTextAlignment(.center)
            }
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
