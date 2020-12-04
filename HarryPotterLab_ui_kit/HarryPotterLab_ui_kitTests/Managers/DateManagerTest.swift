//
//  DateManagerTest.swift
//  HarryPotterLab_ui_kitTests
//
//  Created by Miquel Bosch on 29/11/2020.
//  Copyright © 2020 Miquel Bosch. All rights reserved.
//

import XCTest
@testable import HarryPotterLab_ui_kit

class DateManagerTest: XCTestCase {
    
    // MARK: - Properties
    private var date: Date!
    
    // MARK: - Setup Test
    override func setUp() {
        super.setUp()
        
        let calendar = Calendar.current
        var components = DateComponents()
        components.day = 12
        components.month = 12
        components.year = 2021
        
        date = calendar.date(from: components)
    }
    
    // MARK: - Tests
    func test_convert_string_To_Date_ddMMyyyy() {
        
        let date = DateManager.toDate(from: "12/12/2021", in: .ddMMyyyy)
        XCTAssertEqual(date, self.date)
    }
    
    func test_convert_string_To_Date_incorrect_string() {
        
        let today = Date()
        let date = DateManager.toDate(from: "$", in: .ddMMyyyy)
        let todayTimeInterval = today.timeIntervalSinceReferenceDate
        let dateTimeInterval = date.timeIntervalSinceReferenceDate
        XCTAssertEqual(todayTimeInterval, dateTimeInterval, accuracy: 0.001)
    }
}
