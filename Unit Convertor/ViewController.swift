//
//  ViewController.swift
//  Unit Convertor
//
//  Created by Anu Joshi on 2019-01-21.
//  Copyright © 2019 Anu Joshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var SegmentedUIControl: UISegmentedControl!
    @IBOutlet var tempR: temperatureRange!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempPicker: UIPickerView!
    let unitconvertor = UnitConvertor()
    let userDefaultLastKey = "defaultPicker"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempPicker.delegate=self;
        let  defaultPicker = initialPicker()
        tempPicker.selectRow(defaultPicker, inComponent: 0, animated: true)
        pickerView(tempPicker, didSelectRow: defaultPicker, inComponent: 0)
        SegmentedUIControl.selectedSegmentIndex = initialControl()
    }
    
    
    func  initialPicker() -> Int {
        if let savedRow = UserDefaults.standard.object(forKey: userDefaultLastKey) as? Int{
            return savedRow
        }
        return tempPicker.numberOfRows(inComponent: 0)/2
    }
    
    func initialControl() -> Int {
        if let savedCtrl = UserDefaults.standard.object(forKey: "userDefaultControl") as? Int{
            return savedCtrl
        }
        return 0
    }
    
    
    func saveSelectedRow(row :Int){
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultLastKey)
        defaults.synchronize()
    }
    
    func saveSegmentedControl(index: Int){
        let defaults = UserDefaults.standard
        defaults.set(index, forKey: "userDefaultControl")
        defaults.synchronize()
        
    }
    
    func displayConvertedtemperature(row: Int)  {
        let deg = tempR.values[row]
        switch SegmentedUIControl.selectedSegmentIndex {
            
        case 0:
            tempLabel.text = "\(unitconvertor.degF(degCel: Int(deg)))°F";
            break;
        case 1:
            tempLabel.text = "\(unitconvertor.degC(degFahrenheit: Int(deg)))°C";
            break;
            
        default:
            tempLabel.text = "\(unitconvertor.degF(degCel: Int(deg)))°F";

        }

    }
    
    
    @IBAction func SegmentedUiControlAction(_ sender: UISegmentedControl) {
        switch SegmentedUIControl.selectedSegmentIndex {
        case 0:
            tempLabel.text="°F"
            break;
        case 1:
            tempLabel.text="°C"
            break;
        default:
            tempLabel.text="°F"
        }
        saveSegmentedControl(index: SegmentedUIControl.selectedSegmentIndex)

        self.tempPicker.reloadComponent(0)
        
        
    }
    
}


extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch SegmentedUIControl.selectedSegmentIndex {
        case 0:
            return "\(tempR.values[row])°C"
        case 1:
            return "\(tempR.values[row])°F"
        default:
            return "\(tempR.values[row])°C"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("User tapped row: \(row)")
        saveSelectedRow(row: row)
        displayConvertedtemperature(row: row)
        
    }
    
}
