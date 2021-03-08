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
    
    var result: Measurement<UnitLength> {
        
        let inputInNumber = Double(inputTextField) ?? 0.0
        var inputWithUnit = Measurement(value: 0, unit: UnitLength.meters)
        var outputWithUnit: Measurement<UnitLength>
        
        switch inputUnit {
        case 0:
            inputWithUnit = Measurement(value: inputInNumber, unit: UnitLength.meters)
        case 1:
            inputWithUnit = Measurement(value: inputInNumber, unit: UnitLength.kilometers)
        case 2:
            inputWithUnit = Measurement(value: inputInNumber, unit: UnitLength.feet)
        case 3:
            inputWithUnit = Measurement(value: inputInNumber, unit: UnitLength.yards)
        default:
            inputWithUnit = Measurement(value: inputInNumber, unit: UnitLength.miles)
        }
        
        switch outputUnit {
        case 0:
            outputWithUnit = inputWithUnit.converted(to: UnitLength.meters)
        case 1:
            outputWithUnit = inputWithUnit.converted(to: UnitLength.kilometers)
        case 2:
            outputWithUnit = inputWithUnit.converted(to: UnitLength.feet)
        case 3:
            outputWithUnit = inputWithUnit.converted(to: UnitLength.yards)
        default:
            outputWithUnit = inputWithUnit.converted(to: UnitLength.miles)
        }
        
        return outputWithUnit
    }
    
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
                    Text("\(result.description)")
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
