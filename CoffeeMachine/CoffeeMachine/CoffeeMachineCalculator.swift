//
//  CoffeeMachineCalculator.swift
//  CoffeeMachine
//
//  Created by Ronaldo Garcia on 16/11/23.
//

import Foundation

class CoffeeMachineCalculator {
    
    func getDisplacementTime(firstFloorWorkers first: Int, secondFloorWorkers second: Int, thirdFloorWorkers third: Int) throws -> Int {
        
        var workers: [Int] = [first, second, third]
        
        for i in workers {
            if i < 0 || i > 1000 {
                throw CustomErrors.invalidInputError
            }
        }
        
        let hasDuplicates = workers.count != Set(workers).count
        workers.sort(by: >)
        
        var totalTime: Int = first*2 + third*2
        
        if !hasDuplicates {
            switch workers[0] {
            case first:
                totalTime = second*2 + third*4
            case third:
                totalTime = first*4 + second*2
            default:
                break
            }
        }
    
        print(totalTime)
        return totalTime
    }
    
}
