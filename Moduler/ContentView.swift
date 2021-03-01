//
//  ContentView.swift
//  Moduler
//
//  Created by Mark Rachapoom on 1/3/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userInput = ""
    @State private var modulo = ""
    
    @State private var result = "Result"
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("User input")) {
                    TextField("number", text: $userInput)
                }
                
                Section(header: Text("Modulo")) {
                    TextField("mod", text: $modulo)
                }
                
                Section(header: Text("Result")) {
                    Text(result)
                }

                Button("Calculate") {
                    let number: Int = Int(userInput) ?? 0
                    let mod: Int = Int(modulo) ?? 0
                    self.result = String(number % mod)
                }
            }
            
            .navigationBarTitle("Moduler")
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
