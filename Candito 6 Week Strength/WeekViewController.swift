//
//  WeekViewController.swift
//  Candito 6 Week Strength
//
//  Created by Ern on 2016-03-11.
//  Copyright © 2016 ThoughtPond. All rights reserved.
//

import Foundation
import UIKit

class WeekViewController: UIViewController {
    
    enum defaultsKeys {
        static let startDate = ""
        static let weightUnit = "kg"
        static let benchMax = ""
        static let squatMax = ""
        static let deadliftMax = ""
        static let currentWeek = "Week1"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView()
        scrollView.sizeToFit()
        self.view.addSubview(scrollView)

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Week 1"
        titleLabel.font = UIFont.boldSystemFontOfSize(30)
        titleLabel.textAlignment = .Center
        self.view.addSubview(titleLabel)
        
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
        
        let views = [
            "titleLabel": titleLabel,
        ]
        
        // Collect all constraints to send to the superview
        let vtitleLabelC = NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[titleLabel]", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vtitleLabelC)
        let xtitleLabelC = NSLayoutConstraint(item: titleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xtitleLabelC)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false)
        //counterLabel.text = "The counter was tapped \(numberToDisplay) times."
    }
}