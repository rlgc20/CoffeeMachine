//
//  CoffeeMachineTests.swift
//  CoffeeMachineTests
//
//  Created by Ronaldo Garcia on 16/11/23.
//

import XCTest
@testable import CoffeeMachine

final class CoffeeMachineTests: XCTestCase {

    let calculator = CoffeeMachineCalculator()
    
    func testCoffeeMachineCalculator_differentWorkersPerFloor_firstFloorHasMoreWorkers() {
        do {
            let totalTime = try calculator.getDisplacementTime(firstFloorWorkers: 30, secondFloorWorkers: 10, thirdFloorWorkers: 20)
            XCTAssertEqual(100, totalTime)
        } catch {
            XCTFail()
        }
    }
    
    func testCoffeeMachineCalculator_differentWorkersPerFloor_secondFloorHasMoreWorkers() {
        do {
            let totalTime = try calculator.getDisplacementTime(firstFloorWorkers: 20, secondFloorWorkers: 30, thirdFloorWorkers: 10)
            XCTAssertEqual(60, totalTime)
        } catch {
            XCTFail()
        }
    }
    
    func testCoffeeMachineCalculator_differentWorkersPerFloor_thirdFloorHasMoreWorkers() {
        do {
            let totalTime = try calculator.getDisplacementTime(firstFloorWorkers: 10, secondFloorWorkers: 20, thirdFloorWorkers: 30)
            XCTAssertEqual(80, totalTime)
        } catch {
            XCTFail()
        }
    }
    
    func testCoffeeMachineCalculator_twoFloorsWithSameNumberOfWorkers() {
        do {
            let totalTime = try calculator.getDisplacementTime(firstFloorWorkers: 20, secondFloorWorkers: 10, thirdFloorWorkers: 20)
            XCTAssertEqual(80, totalTime)
        } catch {
            XCTFail()
        }
    }
    
    func testCoffeeMachineCalculator_allFloorsWithSameNumberOfWorkers() {
        do {
            let totalTime = try calculator.getDisplacementTime(firstFloorWorkers: 20, secondFloorWorkers: 20, thirdFloorWorkers: 20)
            XCTAssertEqual(80, totalTime)
        } catch {
            XCTFail()
        }
    }
    
    func testCoffeeMachineCalculator_negativeInput() {
        var thrownError: Error?
        
        XCTAssertThrowsError(try calculator.getDisplacementTime(
            firstFloorWorkers: -10,
            secondFloorWorkers: 20,
            thirdFloorWorkers: 30)) {
                thrownError = $0
            }
        
        XCTAssertTrue(thrownError is CustomErrors)
    }
    
    func testCoffeeMachineCalculator_biggerThanLimitInput() {
        var thrownError: Error?
        
        XCTAssertThrowsError(try calculator.getDisplacementTime(
            firstFloorWorkers: 10,
            secondFloorWorkers: 1001,
            thirdFloorWorkers: 30)) {
                thrownError = $0
            }
        
        XCTAssertTrue(thrownError is CustomErrors)
    }
}
