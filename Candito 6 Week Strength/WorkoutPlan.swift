//
//  WorkoutPlan.swift
//  Candito 6 Week Strength
//
//  Created by Ern on 2016-03-12.
//  Copyright © 2016 ThoughtPond. All rights reserved.
//

import Foundation
import UIKit



// Struct because it doesn't need inheritance, deinitializers, or multipe instances

// Set contains weight for an exercise and the number of repititions
// Would be presented as 100 x6
struct Set {
    var Weight = Int()
    var Reps = String()
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
    var Type = String()
    var Workouts = Array<Workout>()
}

// Singleton struct that contains all data for the workout plan
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
        
        generateWeek1()
        //generateWeek2()
        //generateWeek3()
        //generateWeek4()
        //generateWeek5()
        //generateWeek6()
        
        getTodaysWorkout()
    }
    
    // Calculates weights for Week 1 based on 1RM's and builds plan
    // Rest
    private mutating func generateWeek1() {
        let calendar = NSCalendar.currentCalendar()
        var dayComponent = NSDateComponents()
        let blankSet = Set(Weight: 0, Reps: "")

        // Day 1
        //IF((Inputs!B9="kg"),MROUND((Inputs!B13*0.8),2.5),MROUND((Inputs!B13*0.8),5))
        let squatSet80 = Set(Weight: calculateWeight(SquatMax, modifier: 0.8, weightUnit: WeightUnit), Reps: " x6")
        let deadliftSet80 = Set(Weight: calculateWeight(DeadliftMax, modifier: 0.8, weightUnit: WeightUnit), Reps: " x6")
        
        let exercise1Day1 = Exercise(Name: "Squat", Sets: [squatSet80, squatSet80, squatSet80, squatSet80])
        let exercise2Day1 = Exercise(Name: "Deadlift", Sets: [deadliftSet80, deadliftSet80, blankSet, blankSet])
        let day1 = Workout(Date: StartDate, Type: "Muscular Conditioning", Exercises: [exercise1Day1, exercise2Day1])
        
        // Day 2
        dayComponent.day = 1;
        var nextDate = calendar.dateByAddingComponents(dayComponent, toDate: StartDate, options: [])
        let benchSet50 = Set(Weight: calculateWeight(BenchMax, modifier: 0.5, weightUnit: WeightUnit), Reps: " x10")
        let benchSet675 = Set(Weight: calculateWeight(BenchMax, modifier: 0.675, weightUnit: WeightUnit), Reps: " x10")
        let benchSet7 = Set(Weight: calculateWeight(BenchMax, modifier: 0.7, weightUnit: WeightUnit), Reps: " x8")
        let benchSet775 = Set(Weight: calculateWeight(BenchMax, modifier: 0.775, weightUnit: WeightUnit), Reps: " x6")
        
        let exercise1Day2 = Exercise(Name: "Bench", Sets: [benchSet50, benchSet675, benchSet7, benchSet775])
        let day2 = Workout(Date: nextDate!, Type: "Muscular Conditioning", Exercises: [exercise1Day2])
        
        // Day 3 - REST DAY
        
        // Day 4
        // Same as day 2, but after a rest day
        dayComponent.day = 3;
        nextDate = calendar.dateByAddingComponents(dayComponent, toDate: StartDate, options: [])
        
        let day4 = Workout(Date: nextDate!, Type: "Muscular Conditioning", Exercises: [exercise1Day2])
        
        // Day 5
        dayComponent.day += 4
        nextDate = calendar.dateByAddingComponents(dayComponent, toDate: StartDate, options: [])
        //IF((Inputs!B9="kg"),MROUND((Inputs!B13*0.8),2.5),MROUND((Inputs!B13*0.8),5))
        let squatSet70 = Set(Weight: calculateWeight(SquatMax, modifier: 0.7, weightUnit: WeightUnit), Reps: " x8")
        let deadliftSet70 = Set(Weight: calculateWeight(DeadliftMax, modifier: 0.7, weightUnit: WeightUnit), Reps: " x8")
        
        let exercise1Day4 = Exercise(Name: "Squat", Sets: [squatSet70, squatSet70, squatSet70, squatSet70])
        let exercise2Day4 = Exercise(Name: "Deadlift", Sets: [deadliftSet70, deadliftSet70, blankSet, blankSet])
        let day5 = Workout(Date: StartDate, Type: "Muscular Conditioning", Exercises: [exercise1Day4, exercise2Day4])
        
        // Day 6
        dayComponent.day = 5;
        nextDate = calendar.dateByAddingComponents(dayComponent, toDate: StartDate, options: [])
        let benchSet80 = Set(Weight: calculateWeight(BenchMax, modifier: 0.8, weightUnit: WeightUnit), Reps: " xMR")
        
        let exercise1Day5 = Exercise(Name: "Bench", Sets: [benchSet80, blankSet, blankSet, blankSet])
        let day6 = Workout(Date: nextDate!, Type: "Muscular Conditioning", Exercises: [exercise1Day5])
        
        // Day 7 - REST DAY
        
        let workouts = [day1, day2, day4, day5, day6]
        let week = WorkoutWeek(Name: "Week 1", Type: "Muscular Conditioning", Workouts: workouts)
        Week1 = week
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
    
    func getWorkoutWeek(weekNumber: Int) -> WorkoutWeek {
        return Week1!
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