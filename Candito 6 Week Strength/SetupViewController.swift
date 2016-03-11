//
//  ViewController.swift
//  Candito 6 Week Strength
//
//  Created by Ern on 2016-02-21.
//  Copyright © 2016 ThoughtPond. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //@IBOutlet weak var titleLabel: UILabel!
    //@IBOutlet weak var startDate: UIDatePicker!
    //@IBOutlet weak var benchWeight: UITextField!
    //@IBOutlet weak var squatWeight: UITextField!
    //@IBOutlet weak var deadliftWeight: UITextField!
    
    let benchUnitLabel = UILabel()
    let squatUnitLabel = UILabel()
    let deadliftUnitLabel = UILabel()
    let startDateInput = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        // Declare elements
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Jonnie Candito's\n6 Week Strength Program"
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.boldSystemFontOfSize(20)
        titleLabel.textAlignment = .Center
        self.view.addSubview(titleLabel)
        
        let startDateLabel = UILabel()
        startDateLabel.translatesAutoresizingMaskIntoConstraints = false
        startDateLabel.text = "Start Date"
        startDateLabel.font = UIFont.boldSystemFontOfSize(16)
        startDateLabel.textAlignment = .Center
        self.view.addSubview(startDateLabel)
        
        let pickerView = UIView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        let dateFormat = NSDateFormatter()
        dateFormat.dateStyle = NSDateFormatterStyle.FullStyle
        
        let startDatePicker = UIDatePicker()
        startDatePicker.translatesAutoresizingMaskIntoConstraints = false
        startDatePicker.addTarget(self, action: Selector("updateDateField:"), forControlEvents: UIControlEvents.ValueChanged)
        startDatePicker.setDate(NSDate(), animated:false)
        
        startDateInput.translatesAutoresizingMaskIntoConstraints = false
        startDateInput.text = dateFormat.stringFromDate(NSDate())
        startDateInput.inputView = startDatePicker
        startDateInput.borderStyle = UITextBorderStyle.Line
        self.view.addSubview(startDateInput)
        
        let weightUnitInput = UISegmentedControl(items: ["kgs", "lbs"])
        weightUnitInput.translatesAutoresizingMaskIntoConstraints = false
        weightUnitInput.selectedSegmentIndex = 1
        weightUnitInput.addTarget(self, action: Selector("weightUnitChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(weightUnitInput)

        
        benchUnitLabel.translatesAutoresizingMaskIntoConstraints = false
        benchUnitLabel.text = "kg"
        benchUnitLabel.font = UIFont.boldSystemFontOfSize(16)
        benchUnitLabel.textAlignment = .Left
        self.view.addSubview(benchUnitLabel)

        squatUnitLabel.translatesAutoresizingMaskIntoConstraints = false
        squatUnitLabel.text = "kg"
        squatUnitLabel.font = UIFont.boldSystemFontOfSize(16)
        squatUnitLabel.textAlignment = .Left
        self.view.addSubview(squatUnitLabel)
        
        deadliftUnitLabel.translatesAutoresizingMaskIntoConstraints = false
        deadliftUnitLabel.text = "kg"
        deadliftUnitLabel.font = UIFont.boldSystemFontOfSize(16)
        deadliftUnitLabel.textAlignment = .Left
        self.view.addSubview(deadliftUnitLabel)
        
        let benchLabel = UILabel()
        benchLabel.translatesAutoresizingMaskIntoConstraints = false
        benchLabel.text = "Bench Press 1RM"
        benchLabel.font = UIFont.boldSystemFontOfSize(16)
        benchLabel.textAlignment = .Center
        self.view.addSubview(benchLabel)
       
        let leftBenchSpacer = UIView()
        leftBenchSpacer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(leftBenchSpacer)
        let rightBenchSpacer = UIView()
        rightBenchSpacer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(rightBenchSpacer)
        
        let benchInput = UITextField()
        benchInput.translatesAutoresizingMaskIntoConstraints = false
        benchInput.keyboardType = .NumberPad
        benchInput.delegate = self
        benchInput.borderStyle = UITextBorderStyle.Line
        self.view.addSubview(benchInput)
        
        let squatLabel = UILabel()
        squatLabel.translatesAutoresizingMaskIntoConstraints = false
        squatLabel.text = "Squat 1RM"
        squatLabel.font = UIFont.boldSystemFontOfSize(16)
        squatLabel.textAlignment = .Center
        self.view.addSubview(squatLabel)
        
        let leftSquatSpacer = UIView()
        leftSquatSpacer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(leftSquatSpacer)
        let rightSquatSpacer = UIView()
        rightSquatSpacer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(rightSquatSpacer)
        
        let squatInput = UITextField()
        squatInput.translatesAutoresizingMaskIntoConstraints = false
        squatInput.keyboardType = .NumberPad
        squatInput.delegate = self
        squatInput.borderStyle = UITextBorderStyle.Line
        self.view.addSubview(squatInput)
        
        let deadliftLabel = UILabel()
        deadliftLabel.translatesAutoresizingMaskIntoConstraints = false
        deadliftLabel.text = "Deadlift 1RM"
        deadliftLabel.font = UIFont.boldSystemFontOfSize(16)
        deadliftLabel.textAlignment = .Center
        self.view.addSubview(deadliftLabel)
        
        let leftDeadliftSpacer = UIView()
        leftDeadliftSpacer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(leftDeadliftSpacer)
        let rightDeadliftSpacer = UIView()
        rightDeadliftSpacer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(rightDeadliftSpacer)
        
        let deadliftInput = UITextField()
        deadliftInput.translatesAutoresizingMaskIntoConstraints = false
        deadliftInput.keyboardType = .NumberPad
        deadliftInput.delegate = self
        deadliftInput.borderStyle = UITextBorderStyle.Line
        self.view.addSubview(deadliftInput)
        
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
        ]
        
        // Collect all constraints to send to the superview
        //var allVisualFormatConstraints = [NSLayoutConstraint]()
        //var allConstraints = [NSLayoutConstraint]()
        let vtitleLabelC = NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[titleLabel]-20-[startDateLabel]", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vtitleLabelC)
        //allVisualFormatConstraints += vTitleC
        let xtitleLabelC = NSLayoutConstraint(item: titleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xtitleLabelC)
        //let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(htitleFS, options:[], metrics: nil, views: views)
        //NSLayoutConstraint.activateConstraints(horizontalConstraints)
        //self.view.addConstraints(allConstraints)
        //NSLayoutConstraint.activateConstraints(allVisualFormatConstraints)
        
        let vstartDateLabelC = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[startDateLabel][startDateInput]", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vstartDateLabelC)
        let xstartDateLabelC = NSLayoutConstraint(item: startDateLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xstartDateLabelC)

        let vstartDateInputC = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[startDateInput]-20-[weightUnitInput]", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vstartDateInputC)
        let xstartDateInputC = NSLayoutConstraint(item: startDateInput, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xstartDateInputC)
        
        let vweightUnitInputC = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[weightUnitInput]-20-[benchLabel]", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vweightUnitInputC)
        let xweightUnitInputC = NSLayoutConstraint(item: weightUnitInput, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xweightUnitInputC)
        
        let vbenchLabelC = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[benchLabel][benchInput]", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vbenchLabelC)
        let xbenchLabelC = NSLayoutConstraint(item: benchLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xbenchLabelC)

        let vbenchUnitLabelC = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[benchLabel][benchUnitLabel]", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vbenchUnitLabelC)
        
        let vbenchInputC = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[benchInput]-20-[squatLabel]", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vbenchInputC)
        let hbenchInputC = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[leftBenchSpacer]-[benchInput(75)]-[benchUnitLabel]-[rightBenchSpacer(==leftBenchSpacer)]-|", options: [.AlignAllBaseline], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(hbenchInputC)
        
        let vsquatLabelC = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[squatLabel][squatInput]", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vsquatLabelC)
        let xsquatLabelC = NSLayoutConstraint(item: squatLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xsquatLabelC)
        
        let vsquatUnitLabelC = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[squatLabel][squatUnitLabel]", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vsquatUnitLabelC)
        
        let vsquatInputC = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[squatInput]-20-[deadliftLabel]", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vsquatInputC)
        let hsquatInputC = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[leftSquatSpacer]-[squatInput(75)]-[squatUnitLabel]-[rightSquatSpacer(==leftSquatSpacer)]-|", options: [.AlignAllBaseline], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(hsquatInputC)
        
        let vdeadliftLabelC = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[deadliftLabel][deadliftInput]", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vdeadliftLabelC)
        let xdeadliftLabelC = NSLayoutConstraint(item: deadliftLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xdeadliftLabelC)
        
        //let vdeadliftUnitLabelC = NSLayoutConstraint.constraintsWithVisualFormat(
        //    "V:[deadliftLabel][deadliftUnitLabel]", options:[], metrics: nil, views: views)
        //NSLayoutConstraint.activateConstraints(vdeadliftUnitLabelC)
        
        //let vdeadliftInputC = NSLayoutConstraint.constraintsWithVisualFormat(
        //    "V:[deadliftInput]-20-[deadliftLabel]", options:[], metrics: nil, views: views)
        //NSLayoutConstraint.activateConstraints(vdeadliftInputC)
        let hdeadliftInputC = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[leftDeadliftSpacer]-[deadliftInput(75)]-[deadliftUnitLabel]-[rightDeadliftSpacer(==leftDeadliftSpacer)]-|", options: [.AlignAllBaseline], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(hdeadliftInputC)
    }
    
    func weightUnitChanges(sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        switch sender.selectedSegmentIndex {
        case 1:
            benchUnitLabel.text = "kg"
            squatUnitLabel.text = "kg"
            deadliftUnitLabel.text = "kg"
        case 2:
            benchUnitLabel.text = "lb"
            squatUnitLabel.text = "lb"
            deadliftUnitLabel.text = "lb"
        default:
            break;
        }
    }
    
    func updateDateField(sender: UIDatePicker) {
        let dateFormat = NSDateFormatter()
        dateFormat.dateStyle = NSDateFormatterStyle.FullStyle
        startDateInput.text = dateFormat.stringFromDate(sender.date)
    }
    
    //TODO: Understand this better, rewrite it
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
            // Create an `NSCharacterSet` set which includes everything but the digits
            let inverseSet = NSCharacterSet(charactersInString:"0123456789").invertedSet
            print(inverseSet)
            
            // At every character in this "inverseSet" contained in the string,
            // split the string up into components which exclude the characters
            // in this inverse set
            let components = string.componentsSeparatedByCharactersInSet(inverseSet)
            print(components)
            
            // Rejoin these components
            let filtered = components.joinWithSeparator("")  // use join("", components) if you are using Swift 1.2
            print(filtered)
            
            // If the original string is equal to the filtered string, i.e. if no
            // inverse characters were present to be eliminated, the input is valid
            // and the statement returns true; else it returns false
            return string == filtered
            
    }
    
    // Hide keyboard on tap outside input
    @IBAction func userTappedBackground(sender: AnyObject) {
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

