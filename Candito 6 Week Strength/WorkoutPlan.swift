//
//  WorkoutPlan.swift
//  Candito 6 Week Strength
//
//  Created by Ern on 2016-03-12.
//  Copyright © 2016 ThoughtPond. All rights reserved.
//

import Foundation
import UIKit

enum defaultsKeys {
    static let startDate = "StartDate"
    static let weightUnit = "WeightUnit"
    static let benchMax = "BenchMax"
    static let squatMax = "SquatMax"
    static let deadliftMax = "DeadliftMax"
    static let currentWeek = "CurrentWeek"
}


// Struct because it doesn't need inheritance, deinitializers, or multipe instances

// Set contains weight for an exercise and the number of repititions
// Would be presented as 100 x6
struct Set {
    var Weight = Int()
    var Reps = Int()
}

// Exercises contain exerise name/description and set information
// Ex.["Squat", [Set[100,6], Set[100,6]]]
struct Exercise {
    var Name = String()
    var Sets = Array<Set>()
}

// Workouts contain date to be done, and exercises
// Ex ["Sun March 01, 2015", 
//    [Exercise[["Squat", [Set[100,6], Set[100,6]]]], Exercise[["Deadlift", [Set[100,6], Set[100,6]]]]]]]
struct Workout {
    var Date = NSDate()
    var Type = String()
    var Exercises = Array<Exercise>()
}

// WorkoutWeek contains a name/description and all workouts for the week
// Ex ["Hypertrophy", Workouts[]]
struct WorkoutWeek {
    var Name = String()
    var Workouts = Array<Workout>()
}

struct Plan {
    static let sharedInstance = Plan()
    // Day the program started
    private var StartDate: NSDate
    // Unit to calculate weights in
    // Round to 2.5 for kg and 5 for lb
    private var WeightUnit: String
    // 1RMs for base exercises
    private var BenchMax: Int
    private var SquatMax: Int
    private var DeadliftMax: Int
    
    // Muscular Conditioning
    var Week1: WorkoutWeek?
    //let Week2 = WorkoutWeek()
    //let Week3 = WorkoutWeek()
    //let Week4 = WorkoutWeek()
    //let Week5 = WorkoutWeek()
    //let Week6 = WorkoutWeek()
    
    var TodaysWorkout: Workout?
    
    
    
    private init() {
        let defaults = NSUserDefaults.standardUserDefaults()
        StartDate = defaults.objectForKey(defaultsKeys.startDate) as! NSDate!
        WeightUnit = defaults.stringForKey(defaultsKeys.weightUnit)!
        BenchMax = defaults.integerForKey(defaultsKeys.benchMax)
        SquatMax = defaults.integerForKey(defaultsKeys.squatMax)
        DeadliftMax = defaults.integerForKey(defaultsKeys.deadliftMax)
        
        Week1 = generateWeek1()
        //generateWeek2()
        //generateWeek3()
        //generateWeek4()
        //generateWeek5()
        //generateWeek6()
        
        getTodaysWorkout()
    }
    
    // Calculates weights for Week 1 based on 1RM's
    private mutating func generateWeek1() -> WorkoutWeek {
        // Day 1
        //IF((Inputs!B9="kg"),MROUND((Inputs!B13*0.8),2.5),MROUND((Inputs!B13*0.8),5))
        let squatSet = Set(Weight: calculateWeight(SquatMax, modifier: 0.8, weightUnit: WeightUnit), Reps: 6)
        let deadliftSet = Set(Weight: calculateWeight(DeadliftMax, modifier: 0.8, weightUnit: WeightUnit), Reps: 6)
        
        let exercise1 = Exercise(Name: "Squat", Sets: [squatSet, squatSet, squatSet, squatSet])
        let exercise2 = Exercise(Name: "Deadlift", Sets: [deadliftSet, deadliftSet])
        let day1 = Workout(Date: StartDate, Type: "Muscular Conditioning", Exercises: [exercise1, exercise2])
        
        let week = WorkoutWeek(Name: "Week 1\nMuscular Conditioning", Workouts: [day1])
        return week
    }
    mutating func getTodaysWorkout() {
        // Return first workout for now
        TodaysWorkout = Week1!.Workouts[0]
        //    let calendar: NSCalendar = NSCalendar.currentCalendar()
        //
        //    let components = calendar.components(.Day, fromDate: StartDate, toDate: CurrentDate, options: [])
        //    // Add 1 since day 1 makes more sense than day 0
        //    let daysIn = (components.day + 1)
        //
        //    switch (daysIn) {
        //        case 1...7:
        //            CurrentWeek = Week1
        //        //case 8...14:
        //        //    return 2
        //        //case 15...21:
        //        //    return 3
        //        //case 22...28:
        //        //    return 4
        //        //case 29...35:
        //        //    return 5
        //        //case 36...42:
        //        //    return 6
        //        default:
        //            break;
        //    }
    }
    

}

//TODO Should these utility funcs be in the struct?
func calculateWeight(weight: Int, modifier: Double, weightUnit: String) -> Int {
    switch weightUnit {
        case "kg":
            return roundToKgs(Double(weight) * modifier)
        case "lb":
            return roundToLbs(Double(weight) * modifier)
        default:
           return 0;
    }
}

func roundToLbs (weight: Double) -> Int {
    return (Int)((weight % 5 == 0) ? weight : weight + 5 - (weight % 5))
}
func roundToKgs (weight: Double) -> Int {
    return (Int)((weight % 2.5 == 0) ? weight : weight + 2.5 - (weight % 2.5))
}