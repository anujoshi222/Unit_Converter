//
//  TemperatureRange.swift
//  Unit Convertor
//
//  Created by Anu Joshi on 2019-01-21.
//  Copyright © 2019 Anu Joshi. All rights reserved.
//
import UIKit
import Foundation

class temperatureRange:NSObject, UIPickerViewDataSource{
    
    
    
     var values = (-100...100).map{$0}
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "\(values[row])°"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("User tapped row: \(row)")
        _ = Float(values[row])
        
    }
    
    
    
}
