//
//  SolarDateTestCase.swift
//  
//
//  Created by Mac Van Anh on 8/18/20.
//

import XCTest
@testable import Amlich

final class SolarDateTestCase: XCTestCase {
    func test_of() {
        let lunarDate = LunarDate(day: 29, month: 6, year: 2020, isLeap: false)
        let hanoiTimeZone: Double = +7
        let solarDate = SolarDate.of(lunar: lunarDate, with: hanoiTimeZone)

        XCTAssertEqual(solarDate.day, 18)
        XCTAssertEqual(solarDate.month, 8)
        XCTAssertEqual(solarDate.year, 2020)
    }

    func test_fromDateObject() {
        let formatter = DateFormatter()

        formatter.dateFormat = "yyyy MM dd"
        let date = formatter.date(from: "2020 8 21")!

        let solarDate = SolarDate.from(date)

        XCTAssertEqual(solarDate.day, 21)
        XCTAssertEqual(solarDate.month, 8)
        XCTAssertEqual(solarDate.year, 2020)
    }

    func test_ofDateObject() {
        let formatter = DateFormatter()

        formatter.dateFormat = "yyyy MM dd"
        let date = formatter.date(from: "2020 7 3")!

        let solarDate = SolarDate.of(date, with: 7)

        XCTAssertEqual(solarDate.day, 21)
        XCTAssertEqual(solarDate.month, 8)
        XCTAssertEqual(solarDate.year, 2020)
    }

    func test_toLunar() {
        let solarDate = SolarDate(day: 18, month: 8, year: 2020)
        let hanoiTimeZone = +7.0
        let lunarDate = solarDate.toLunar(with: hanoiTimeZone);
        
        XCTAssertEqual(lunarDate.day, 29)
        XCTAssertEqual(lunarDate.month, 6)
        XCTAssertEqual(lunarDate.year, 2020)
    }

    func test_toDate() {
        let solarDate = SolarDate(day: 1, month: 6, year: 2020)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy"

        let expectedDate = dateFormatter.date(from: "1 6 2020")!

        let date = solarDate.toDate()!
        XCTAssertTrue(date.compare(expectedDate) == .orderedSame)

        let invalidSolarDate = SolarDate(day: 0, month: 0, year: 0)
        XCTAssertNil(invalidSolarDate.toDate())
    }

    func test_comparable() {
        let solarDate1 = SolarDate(day: 10, month: 10, year: 2020)
        let solarDate2 = SolarDate(day: 11, month: 10, year: 2020)
        
        XCTAssertTrue(solarDate1 < solarDate2)
        XCTAssertTrue(solarDate1 <= solarDate2)
        XCTAssertTrue(solarDate2 > solarDate1)
        XCTAssertTrue(solarDate2 >= solarDate1)

        XCTAssertFalse(solarDate2 == solarDate1)
    }

    func test_equalable() {
        let solarDate1 = SolarDate(day: 10, month: 10, year: 2020)
        let solarDate2 = SolarDate(day: 10, month: 10, year: 2020)
        
        XCTAssertFalse(solarDate1 < solarDate2)
        XCTAssertFalse(solarDate2 > solarDate1)

        XCTAssertTrue(solarDate1 <= solarDate2)
        XCTAssertTrue(solarDate2 >= solarDate1)
        XCTAssertTrue(solarDate2 == solarDate1)
    }
}
