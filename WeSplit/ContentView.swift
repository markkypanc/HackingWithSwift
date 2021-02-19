//
//  ContentView.swift
//  WeSplit
//
//  Created by Mark Rachapoom on 19/2/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Section  {
                    Text("Hello, World")
                    Text("This is the second label")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
