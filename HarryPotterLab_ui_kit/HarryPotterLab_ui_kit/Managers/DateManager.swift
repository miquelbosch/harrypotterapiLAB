//
//  DateManager.swift
//  HarryPotterLab_ui_kit
//
//  Created by Miquel Bosch on 29/11/2020.
//  Copyright © 2020 Miquel Bosch. All rights reserved.
//

import Foundation

public enum DateFormat: String {
    case ddMMyyyy = "dd/MM/yyyy"
}


public final class DateManager {
    
    public class func toDate(from date: String, in format: DateFormat) -> Date {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.date(from: date)!
    }
}
