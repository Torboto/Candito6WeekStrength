//
//  Constants.swift
//  You-Can-Dito 6 Week Strength
//
//  Created by Ern on 2016-03-15.
//  Copyright © 2016 ThoughtPond. All rights reserved.
//

import Foundation
import UIKit

// Keys for accessing the default values start in NSUserDefaults
enum defaultsKeys {
    static let startDate = "StartDate"
    static let weightUnit = "WeightUnit"
    static let benchMax = "BenchMax"
    static let squatMax = "SquatMax"
    static let deadliftMax = "DeadliftMax"
    static let currentWeek = "CurrentWeek"
}

// Dark Green used for controls
let darkGreen = UIColor(red: 40/255, green: 181/255, blue: 47/255, alpha: 1)

// Global Plan variable as plan never changes, and only one should ever exist
let plan = Plan.sharedInstance
