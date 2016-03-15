//
//  WeekViewController.swift
//  You-Can-Dito 6 Week Strength
//
//  Created by Ern on 2016-03-14.
//  Copyright © 2016 ThoughtPond. All rights reserved.
//

import Foundation
import UIKit


class WeekViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var workoutWeek: WorkoutWeek!
    var weekNumber: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workoutWeek = plan.getWorkoutWeek(weekNumber)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = workoutWeek.Name
        
        let dateFormat = NSDateFormatter()
        dateFormat.dateStyle = NSDateFormatterStyle.FullStyle
        
        // Label and View to be inserted into TableView as header
        // View is required to have extra padding around label
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = workoutWeek.Workouts[0].Type
        titleLabel.font = UIFont.boldSystemFontOfSize(25)
        titleLabel.textAlignment = .Center
        let labelView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        self.view.addSubview(labelView)
        labelView.addSubview(titleLabel)
        
        let workoutTableView = UITableView(frame: CGRectZero, style: .Grouped)
        workoutTableView.translatesAutoresizingMaskIntoConstraints = false
        workoutTableView.delegate = self
        workoutTableView.dataSource = self
        workoutTableView.sizeToFit()
        self.view.addSubview(workoutTableView)
        workoutTableView.tableHeaderView = labelView
        
        // Set constraints
        let views = [
            "titleLabel": titleLabel,
            "workoutTableView": workoutTableView,
        ]
        
        let vviewC = NSLayoutConstraint.constraintsWithVisualFormat("V:|[workoutTableView]-10-|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vviewC)
        
        let vtitleLabelC = NSLayoutConstraint.constraintsWithVisualFormat("V:|[titleLabel]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vtitleLabelC)
        let htitleLabelC = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[titleLabel]-|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(htitleLabelC)
        let xtitleLabelC = NSLayoutConstraint(item: titleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xtitleLabelC)
        let ytitleLabelC = NSLayoutConstraint(item: titleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: labelView, attribute: .CenterY, multiplier: 1, constant: 0)
        self.view.addConstraint(ytitleLabelC)
        
        let hworkoutTableViewC = NSLayoutConstraint.constraintsWithVisualFormat("H:|[workoutTableView]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(hworkoutTableViewC)
    }
    
    // ---------------------------------------------------
    // TableView Delegate and Datasource extended methods
    // ---------------------------------------------------
    
    // Sections in table are equal to the number of workouts in the week
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return workoutWeek.Workouts.count
    }
    
    // Height for header for each section in table, larger for some padding
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    // Create view with label containing day of workout
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let dateFormat = NSDateFormatter()
        dateFormat.dateStyle = NSDateFormatterStyle.FullStyle
        
        let labelView = UIView()
        labelView.backgroundColor = .lightGrayColor()
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = UIFont.boldSystemFontOfSize(18)
        headerLabel.text = dateFormat.stringFromDate(workoutWeek.Workouts[section].Date)
        
        tableView.addSubview(labelView)
        labelView.addSubview(headerLabel)
        
        let hheaderLabelC = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[headerLabel]|", options:[], metrics: nil, views: ["headerLabel": headerLabel])
        NSLayoutConstraint.activateConstraints(hheaderLabelC)
        let vheaderLabelC = NSLayoutConstraint.constraintsWithVisualFormat("V:|[headerLabel]|", options:[], metrics: nil, views: ["headerLabel": headerLabel])
        NSLayoutConstraint.activateConstraints(vheaderLabelC)
        return labelView
    }
    
    // Returns the total number of exercises in an exercise day, which is the number of rows in a section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutWeek.Workouts[section].Exercises.count
    }
    
    // Add five labels to cell that contain exercise name, and sets
    // Ex. |Deadlift| |80 x6| |80 x6| |80 x6| |80x6|
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let cell = UITableViewCell()
        cell.selectionStyle = .None
        
        let exercise = workoutWeek.Workouts[indexPath.section].Exercises[indexPath.row]
        
        // Create Views
        let exerciseName: UILabel = UILabel()
        exerciseName.translatesAutoresizingMaskIntoConstraints = false
        exerciseName.font = UIFont.boldSystemFontOfSize(15)
        exerciseName.textAlignment = .Center
        exerciseName.text = exercise.Name
        cell.contentView.addSubview(exerciseName)
        
        let set1: UILabel = UILabel()
        set1.translatesAutoresizingMaskIntoConstraints = false
        set1.font = UIFont.boldSystemFontOfSize(15)
        set1.textAlignment = .Center
        cell.contentView.addSubview(set1)
        
        let set2: UILabel = UILabel()
        set2.translatesAutoresizingMaskIntoConstraints = false
        set2.font = UIFont.boldSystemFontOfSize(15)
        set2.textAlignment = .Center
        cell.contentView.addSubview(set2)
        
        let set3: UILabel = UILabel()
        set3.translatesAutoresizingMaskIntoConstraints = false
        set3.font = UIFont.boldSystemFontOfSize(15)
        set3.textAlignment = .Center
        cell.contentView.addSubview(set3)
        
        let set4: UILabel = UILabel()
        set4.translatesAutoresizingMaskIntoConstraints = false
        set4.font = UIFont.boldSystemFontOfSize(15)
        set4.textAlignment = .Center
        cell.contentView.addSubview(set4)
        
        // Build set text "80 x7"
        var set1Info = String(exercise.Sets[0].Weight)
        set1Info += String(exercise.Sets[0].Reps)
        set1.text = set1Info
        var set2Info = String(exercise.Sets[1].Weight)
        set2Info += String(exercise.Sets[1].Reps)
        set2.text = set2Info
        var set3Info = String(exercise.Sets[2].Weight)
        set3Info += String(exercise.Sets[2].Reps)
        set3.text = set3Info
        var set4Info = String(exercise.Sets[3].Weight)
        set4Info += String(exercise.Sets[3].Reps)
        set4.text = set4Info
        
        // Change blank set text so it looks nicer
        let sets = [set1, set2, set3, set4]
        for set in sets {
            if set.text == "0" {
                set.text = "---"
            }
        }
        
        // Set Constraints
        let views = [
            "exerciseName": exerciseName,
            "set1": set1,
            "set2": set2,
            "set3": set3,
            "set4": set4
        ]
        let vexerciseNameC = NSLayoutConstraint.constraintsWithVisualFormat("V:|[exerciseName]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vexerciseNameC)
        let vset1C = NSLayoutConstraint.constraintsWithVisualFormat("V:|[set1]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vset1C)
        let vset2C = NSLayoutConstraint.constraintsWithVisualFormat("V:|[set2]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vset2C)
        let vset3C = NSLayoutConstraint.constraintsWithVisualFormat("V:|[set3]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vset3C)
        let vset4C = NSLayoutConstraint.constraintsWithVisualFormat("V:|[set4]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vset4C)
        let hsetC = NSLayoutConstraint.constraintsWithVisualFormat("H:|[exerciseName][set1(==exerciseName)][set2(==set1)][set3(==set2)][set4(==set3)]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(hsetC)
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}