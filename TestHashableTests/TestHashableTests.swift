//
//  TestHashableTests.swift
//  TestHashableTests
//
//  Created by Алексей Кудрявцев on 22.03.2021.
//

import XCTest
@testable import TestHashable

class TestHashableTests: XCTestCase {
    
    func testOld() throws {
        self.measure(options: options) {
            runAndCheck { OldHashable() }
        }
    }
    
    func testNew() throws {
        self.measure(options: options) {
            runAndCheck { NewHashable() }
        }
    }

    func testTweaked() throws {
        self.measure(options: options) {
            runAndCheck { TweakedHashable() }
        }
    }
    
    let options: XCTMeasureOptions = {
        let options = XCTMeasureOptions.default
        options.iterationCount = 1000
        return options
    }()
    
    func runAndCheck<T: Hashable>(_ createValue: () -> T) {
        var set = Set<T>()
        set.insert(createValue())
        
        let testValue = createValue()
        
        for _ in 1...1000 {
            XCTAssertFalse(set.contains(testValue))
            XCTAssertFalse(set.contains(testValue))
            XCTAssertFalse(set.contains(testValue))
            XCTAssertFalse(set.contains(testValue))
            XCTAssertFalse(set.contains(testValue))

            set.insert(testValue)
            XCTAssertTrue(set.contains(testValue))
            XCTAssertTrue(set.contains(testValue))
            XCTAssertTrue(set.contains(testValue))
            XCTAssertTrue(set.contains(testValue))
            XCTAssertTrue(set.contains(testValue))
            
            set.remove(testValue)
            XCTAssertFalse(set.contains(testValue))
            XCTAssertFalse(set.contains(testValue))
            XCTAssertFalse(set.contains(testValue))
            XCTAssertFalse(set.contains(testValue))
            XCTAssertFalse(set.contains(testValue))

        }
    }
}
