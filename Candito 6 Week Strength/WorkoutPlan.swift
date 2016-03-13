//
//  WorkoutPlan.swift
//  Candito 6 Week Strength
//
//  Created by Ern on 2016-03-12.
//  Copyright © 2016 ThoughtPond. All rights reserved.
//

import Foundation

// Struct because it doesn't need inheritance, deinitializers, or multipe instances
struct Workout {
    enum defaultsKeys {
        static let startDate = ""
        static let weightUnit = "kg"
        static let benchMax = ""
        static let squatMax = ""
        static let deadliftMax = ""
    }
    
    private let startDate = NSDate()
    private let weightUnit = String()
    private let benchMax = String()
    private let squatMax = String()
    private let deadliftMax = String()
    
    func currentWeek () -> String {
        //TODO currentDate - startDate / 7
        return "Week1"
    }
    
    func todaysWorkout () -> Array<String> {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        //defaults.setValue(startDateInput.text, forKey: defaultsKeys.startDate)
        //defaults.setValue(benchUnitLabel.text , forKey: defaultsKeys.weightUnit)
        //defaults.setValue(benchInput.text , forKey: defaultsKeys.benchMax)
        //defaults.setValue(squatInput.text , forKey: defaultsKeys.squatMax)
        //defaults.setValue(deadliftInput.text , forKey: defaultsKeys.deadliftMax)
        //
        //if let stringOne = defaults.stringForKey(defaultsKeys.keyOne) {
        //    println(stringOne) // Some String Value
        //}
        //
        //if let stringTwo = defaults.stringForKey(defaultsKeys.keyTwo) {
        //    println(stringTwo) // Another String Value
        //}
        return []
    }
}