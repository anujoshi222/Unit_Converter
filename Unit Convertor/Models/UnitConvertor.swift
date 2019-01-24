//
//  File.swift
//  Unit Convertor
//
//  Created by Anu Joshi on 2019-01-21.
//  Copyright © 2019 Anu Joshi. All rights reserved.
//

import Foundation

class UnitConvertor{
    func degF(degCel: Int) -> Int {
        return(Int(1.8 * Float(degCel) + 32.0))
        
    }
    
    func degC(degFahrenheit: Int) -> Int {
        return (Int(( 5 * (Float(degFahrenheit) - 32.0))/9))
    }
    
}
