//
//  ContentView.swift
//  UnitConverter
//
//  Created by Mark Rachapoom on 20/2/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputTextField = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let unit: [String] = ["m", "km", "ft", "yd", "mi"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter value", text: $inputTextField)
                        .keyboardType(.decimalPad)
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0..<self.unit.count) {
                            Text(unit[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output unit")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(0..<self.unit.count) {
                            Text(unit[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    Text("Blank for now")
                }
            }.navigationBarTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 
 If you were going for length conversion you might have:

 A segmented control for meters, kilometers, feet, yard, or miles, for the input unit.
 A second segmented control for meters, kilometers, feet, yard, or miles, for the output unit.
 A text field where users enter a number.
 A text view showing the result of the conversion.
 
 */
