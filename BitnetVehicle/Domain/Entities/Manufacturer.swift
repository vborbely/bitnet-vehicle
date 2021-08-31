//
//  Reminder.swift
//  Today
//
//  Created by Borbély Viktor on 2021. 08. 28..
//

import Foundation

struct Manufacturer {
    var name: String
    var vehicleTypes: [String]
}

extension Manufacturer {
    
    static var testData = [
        Manufacturer(name: "Manufacturer #1", vehicleTypes: ["Type #1", "Type #2","Type #1", "Type #2","Type #1", "Type #2","Type #1", "Type #2","Type #1", "Type #2"]),
        Manufacturer(name: "Manufacturer #2", vehicleTypes: ["Type #1", "Type #2"]),
    ]
}

