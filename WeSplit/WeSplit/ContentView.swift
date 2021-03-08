//
//  ContentView.swift
//  WeSplit
//
//  Created by Mark Rachapoom on 19/2/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(Int(numberOfPeople) ?? 0)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0.0
        
        let tipValue = (tipSelection / 100) * orderAmount
        let billTotal = orderAmount + tipValue
        let amountPerPerson = billTotal / peopleCount
        
        return amountPerPerson
    }
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0.0
        
        let tipValue = (tipSelection / 100) * orderAmount
        let billTotal = orderAmount + tipValue
        
        return billTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")){
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    if checkAmount != "" {
                        Text("$\(totalPerPerson, specifier: "%.2f")")
                    } else {
                        Text("$0.00")
                    }
                }
                
                Section(header: Text("Total amount")) {
                    Text("$\(self.grandTotal, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
