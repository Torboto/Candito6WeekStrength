//
//  ViewController.swift
//  Candito 6 Week Strength
//
//  Created by Ern on 2016-02-21.
//  Copyright © 2016 ThoughtPond. All rights reserved.
//

import UIKit
import SwiftValidator


class SetupViewController: UIViewController, UITextFieldDelegate, ValidationDelegate {
    let validator = Validator()
    let benchUnitLabel = UILabel()
    let squatUnitLabel = UILabel()
    let deadliftUnitLabel = UILabel()
    let benchInput = UITextField()
    let squatInput = UITextField()
    let deadliftInput = UITextField()
    let startDateInput = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO Validate startDateInput
        //validator.registerField(stateDateInput, rules: [RequiredRule()])
        validator.registerField(benchInput, rules: [RequiredRule()])
        validator.registerField(squatInput, rules: [RequiredRule()])
        validator.registerField(deadliftInput, rules: [RequiredRule()])
    
        // Declare elements
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Jonnie Candito's\n6 Week Strength Program"
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.boldSystemFontOfSize(30)
        titleLabel.textAlignment = .Center
        self.view.addSubview(titleLabel)
        
        let startDateLabel = UILabel()
        startDateLabel.translatesAutoresizingMaskIntoConstraints = false
        startDateLabel.text = "Start Date"
        startDateLabel.font = UIFont.boldSystemFontOfSize(20)
        startDateLabel.textAlignment = .Center
        self.view.addSubview(startDateLabel)
        
        let pickerView = UIView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        let dateFormat = NSDateFormatter()
        dateFormat.dateStyle = NSDateFormatterStyle.FullStyle
        
        let startDatePicker = UIDatePicker()
        startDatePicker.translatesAutoresizingMaskIntoConstraints = false
        startDatePicker.datePickerMode = UIDatePickerMode.Date
        startDatePicker.addTarget(self, action: Selector("updateStartDateInput:"), forControlEvents: UIControlEvents.ValueChanged)
        startDatePicker.setDate(NSDate(), animated:false)
        
        startDateInput.translatesAutoresizingMaskIntoConstraints = false
        startDateInput.text = dateFormat.stringFromDate(NSDate())
        startDateInput.inputView = startDatePicker
        startDateInput.borderStyle = UITextBorderStyle.RoundedRect
        startDateInput.textAlignment = .Center
        self.view.addSubview(startDateInput)
        
        let weightUnitInput = UISegmentedControl(items: ["kgs", "lbs"])
        weightUnitInput.translatesAutoresizingMaskIntoConstraints = false
        weightUnitInput.selectedSegmentIndex = 0
        weightUnitInput.addTarget(self, action: Selector("weightUnitChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(weightUnitInput)

        
        benchUnitLabel.translatesAutoresizingMaskIntoConstraints = false
        benchUnitLabel.text = "kg"
        benchUnitLabel.font = UIFont.boldSystemFontOfSize(20)
        benchUnitLabel.textAlignment = .Left
        self.view.addSubview(benchUnitLabel)

        squatUnitLabel.translatesAutoresizingMaskIntoConstraints = false
        squatUnitLabel.text = "kg"
        squatUnitLabel.font = UIFont.boldSystemFontOfSize(20)
        squatUnitLabel.textAlignment = .Left
        self.view.addSubview(squatUnitLabel)
        
        deadliftUnitLabel.translatesAutoresizingMaskIntoConstraints = false
        deadliftUnitLabel.text = "kg"
        deadliftUnitLabel.font = UIFont.boldSystemFontOfSize(20)
        deadliftUnitLabel.textAlignment = .Left
        self.view.addSubview(deadliftUnitLabel)
        
        let benchLabel = UILabel()
        benchLabel.translatesAutoresizingMaskIntoConstraints = false
        benchLabel.text = "Bench Press 1RM"
        benchLabel.font = UIFont.boldSystemFontOfSize(20)
        benchLabel.textAlignment = .Center
        self.view.addSubview(benchLabel)
       
        let leftBenchSpacer = UIView()
        leftBenchSpacer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(leftBenchSpacer)
        let rightBenchSpacer = UIView()
        rightBenchSpacer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(rightBenchSpacer)
        
        benchInput.translatesAutoresizingMaskIntoConstraints = false
        benchInput.keyboardType = .NumberPad
        benchInput.delegate = self
        benchInput.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(benchInput)
        
        let squatLabel = UILabel()
        squatLabel.translatesAutoresizingMaskIntoConstraints = false
        squatLabel.text = "Squat 1RM"
        squatLabel.font = UIFont.boldSystemFontOfSize(20)
        squatLabel.textAlignment = .Center
        self.view.addSubview(squatLabel)
        
        let leftSquatSpacer = UIView()
        leftSquatSpacer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(leftSquatSpacer)
        let rightSquatSpacer = UIView()
        rightSquatSpacer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(rightSquatSpacer)
        
        squatInput.translatesAutoresizingMaskIntoConstraints = false
        squatInput.keyboardType = .NumberPad
        squatInput.delegate = self
        squatInput.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(squatInput)
        
        let deadliftLabel = UILabel()
        deadliftLabel.translatesAutoresizingMaskIntoConstraints = false
        deadliftLabel.text = "Deadlift 1RM"
        deadliftLabel.font = UIFont.boldSystemFontOfSize(20)
        deadliftLabel.textAlignment = .Center
        self.view.addSubview(deadliftLabel)
        
        let leftDeadliftSpacer = UIView()
        leftDeadliftSpacer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(leftDeadliftSpacer)
        let rightDeadliftSpacer = UIView()
        rightDeadliftSpacer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(rightDeadliftSpacer)
        
        deadliftInput.translatesAutoresizingMaskIntoConstraints = false
        deadliftInput.keyboardType = .NumberPad
        deadliftInput.delegate = self
        deadliftInput.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(deadliftInput)
        
        let createProgram = UIButton()
        createProgram.translatesAutoresizingMaskIntoConstraints = false
        createProgram.setTitle("Start Squatting", forState: .Normal)
        createProgram.backgroundColor = UIColor.blueColor()
        createProgram.layer.cornerRadius = 5
        createProgram.layer.borderWidth = 1
        createProgram.layer.borderColor = UIColor.blueColor().CGColor
        createProgram.addTarget(self, action: Selector("createProgramTapped:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(createProgram)
        
        
        // Declare list of views, add string values for using Visual Format Language
        //TODO: Dear god figure out how to dynamically build the views dictionary
        let views = [
            "titleLabel": titleLabel,
            "startDateLabel": startDateLabel,
            "startDateInput": startDateInput,
            "weightUnitInput": weightUnitInput,
            "benchLabel": benchLabel,
            "leftBenchSpacer": leftBenchSpacer,
            "rightBenchSpacer": rightBenchSpacer,
            "benchInput": benchInput,
            "benchUnitLabel": benchUnitLabel,
            "squatLabel": squatLabel,
            "leftSquatSpacer": leftSquatSpacer,
            "rightSquatSpacer": rightSquatSpacer,
            "squatInput": squatInput,
            "squatUnitLabel": squatUnitLabel,
            "deadliftLabel": deadliftLabel,
            "leftDeadliftSpacer": leftDeadliftSpacer,
            "rightDeadliftSpacer": rightDeadliftSpacer,
            "deadliftInput": deadliftInput,
            "deadliftUnitLabel": deadliftUnitLabel,
            "createProgram": createProgram,
        ]
        
        let vInputC = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-20-[titleLabel]-40-[startDateLabel][startDateInput]-20-[weightUnitInput]-20-[benchLabel][benchInput]-20-[squatLabel][squatInput]-20-[deadliftLabel][deadliftInput]", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vInputC)
        let xtitleLabelC = NSLayoutConstraint(item: titleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xtitleLabelC)
        
        let xstartDateLabelC = NSLayoutConstraint(item: startDateLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xstartDateLabelC)

        let hstartDateInputC = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[startDateInput]-|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(hstartDateInputC)
        let xstartDateInputC = NSLayoutConstraint(item: startDateInput, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xstartDateInputC)
        
        let hweightUnitInputC = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[weightUnitInput]-|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(hweightUnitInputC)
        let xweightUnitInputC = NSLayoutConstraint(item: weightUnitInput, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xweightUnitInputC)
        
        let xbenchLabelC = NSLayoutConstraint(item: benchLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xbenchLabelC)

        let hbenchInputC = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[leftBenchSpacer]-[benchInput(75)]-[benchUnitLabel]-[rightBenchSpacer(==leftBenchSpacer)]-|", options: [.AlignAllBaseline], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(hbenchInputC)
        
        let xsquatLabelC = NSLayoutConstraint(item: squatLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xsquatLabelC)
        
        
        let hsquatInputC = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[leftSquatSpacer]-[squatInput(75)]-[squatUnitLabel]-[rightSquatSpacer(==leftSquatSpacer)]-|", options: [.AlignAllBaseline], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(hsquatInputC)
        
        let xdeadliftLabelC = NSLayoutConstraint(item: deadliftLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xdeadliftLabelC)
        
        
        let hdeadliftInputC = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[leftDeadliftSpacer]-[deadliftInput(75)]-[deadliftUnitLabel]-[rightDeadliftSpacer(==leftDeadliftSpacer)]-|", options: [.AlignAllBaseline], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(hdeadliftInputC)

        let vcreateProgramC = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[createProgram(50)]-10-|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vcreateProgramC)
        let hcreateProgramC = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-20-[createProgram]-20-|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(hcreateProgramC)
        let xcreateProgramC = NSLayoutConstraint(item: createProgram, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xcreateProgramC)
    
        //TEST
        benchInput.text = "100"
        squatInput.text = "100"
        deadliftInput.text = "100"
    
    }
    
    func weightUnitChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            benchUnitLabel.text = "kg"
            squatUnitLabel.text = "kg"
            deadliftUnitLabel.text = "kg"
        case 1:
            benchUnitLabel.text = "lb"
            squatUnitLabel.text = "lb"
            deadliftUnitLabel.text = "lb"
        default:
            break;
        }
    }
    
    func updateStartDateInput(sender: UIDatePicker) {
        let dateFormat = NSDateFormatter()
        dateFormat.dateStyle = NSDateFormatterStyle.FullStyle
        startDateInput.text = dateFormat.stringFromDate(sender.date)
    }
    
    //TODO: Understand this better, rewrite it
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
            // Create an `NSCharacterSet` set which includes everything but the digits
            let inverseSet = NSCharacterSet(charactersInString:"0123456789").invertedSet
        
            // At every character in this "inverseSet" contained in the string,
            // split the string up into components which exclude the characters
            // in this inverse set
            let components = string.componentsSeparatedByCharactersInSet(inverseSet)
        
            // Rejoin these components
            let filtered = components.joinWithSeparator("")  // use join("", components) if you are using Swift 1.2
        
            // If the original string is equal to the filtered string, i.e. if no
            // inverse characters were present to be eliminated, the input is valid
            // and the statement returns true; else it returns false
            return string == filtered
    }
    
    
    func createProgramTapped(sender: UIButton) {
        validator.validate(self)
    }
    
    func validationFailed(errors:[UITextField:ValidationError]) {
        // Turn previously failed fields back to gray
        for (field, _) in validator.validations {
            field.layer.borderColor = UIColor.grayColor().CGColor
        }
        // turn the fields to red
        for (field, error) in validator.errors {
            field.layer.borderColor = UIColor.redColor().CGColor
            field.layer.borderWidth = 1
            field.layer.cornerRadius = 5
            error.errorLabel?.text = error.errorMessage // works if you added labels
            error.errorLabel?.hidden = false
        }
    }
    
    func validationSuccessful() {
        //presentViewController(weekViewController, animated: false, completion: nil)
        
        //if let destinationVC = segue.destinationViewController as? OtherViewController{
        //    destinationVC.numberToDisplay = counter
        //}
        
        //TODO Save data locally, send to Week1View
        // Store simple data locally in User Defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let dateFormat = NSDateFormatter()
        dateFormat.dateStyle = NSDateFormatterStyle.FullStyle
        let startDate = dateFormat.dateFromString(startDateInput.text!)
        
        defaults.setObject(startDate, forKey: defaultsKeys.startDate)
        defaults.setValue(benchUnitLabel.text , forKey: defaultsKeys.weightUnit)
        defaults.setInteger(Int(benchInput.text!)!, forKey: defaultsKeys.benchMax)
        defaults.setInteger(Int(squatInput.text!)!, forKey: defaultsKeys.squatMax)
        defaults.setInteger(Int(deadliftInput.text!)!, forKey: defaultsKeys.deadliftMax)
        
        defaults.synchronize()
        print((NSUserDefaults.standardUserDefaults()).dynamicType)
        
        let todaysWorkoutViewController = TodaysWorkoutViewController()
        //let todaysWorkoutViewController = WorkoutTableViewController()
        self.navigationController?.pushViewController(todaysWorkoutViewController, animated: false)
    }
    
    // Hide keyboard on tap outside input
    func userTappedBackground(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // Hide keyboard on 'Return' key press
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

