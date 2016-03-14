//
//  WorkoutTableViewController.swift
//  Candito 6 Week Strength
//
//  Created by Ern on 2016-03-13.
//  Copyright © 2016 ThoughtPond. All rights reserved.
//

import UIKit

class WorkoutTableViewController: UITableViewController {
    //override func viewDidLoad() {
    //    super.viewDidLoad()
    //    //tableView.dataSource = self;

    //    tableView.delegate = self;
    //    
    //    tableView.registerClass(SetCell.self, forCellReuseIdentifier: "SetCell")
    //}
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return plan.TodaysWorkout!.Exercises.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return plan.TodaysWorkout!.Exercises[section].Sets.count
        return 1
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return plan.TodaysWorkout!.Exercises[section].Name
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.registerClass(SetCell.self, forCellReuseIdentifier: "SetCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let cell = tableView.dequeueReusableCellWithIdentifier( "SetCell", forIndexPath: indexPath)
        //cell.exercise = plan.TodaysWorkout!.Exercises[indexPath.section]
        
        let set1: UILabel = UILabel()
        set1.translatesAutoresizingMaskIntoConstraints = false
        set1.font = UIFont.boldSystemFontOfSize(20)
        set1.textAlignment = .Center
        cell.contentView.addSubview(set1)
        let set2: UILabel = UILabel()
        set2.translatesAutoresizingMaskIntoConstraints = false
        set2.font = UIFont.boldSystemFontOfSize(20)
        set2.textAlignment = .Center
        cell.contentView.addSubview(set2)
        let set3: UILabel = UILabel()
        set3.translatesAutoresizingMaskIntoConstraints = false
        set3.font = UIFont.boldSystemFontOfSize(20)
        set3.textAlignment = .Center
        cell.contentView.addSubview(set3)
        let set4: UILabel = UILabel()
        set4.translatesAutoresizingMaskIntoConstraints = false
        set4.font = UIFont.boldSystemFontOfSize(20)
        set4.textAlignment = .Center
        cell.contentView.addSubview(set4)
        
        // Configure the cell...
        //cell.textLabel?.text = setInfo
        let exercise = plan.TodaysWorkout!.Exercises[indexPath.section]
        var set1Info = String(exercise.Sets[0].Weight)
        set1Info += " x"
        set1Info += String(exercise.Sets[0].Reps)
        set1.text = set1Info
        var set2Info = String(exercise.Sets[1].Weight)
        set2Info += " x"
        set2Info += String(exercise.Sets[1].Reps)
        set2.text = set2Info
        //if let set = exercise?.Sets[2] {
        //    var setInfo = String(set.Weight)
        //    setInfo += " x"
        //    setInfo += String(set.Reps)
        //    set3.text = setInfo
        //} else {
        //    set2.text = ""
        //}
        //if let set = exercise?.Sets[3] {
        //    var setInfo = String(set.Weight)
        //    setInfo += " x"
        //    setInfo += String(set.Reps)
        //    set4.text = setInfo
        //} else {
        //    set2.text = ""
        //}
        
        let views = [
            "set1": set1,
            "set2": set2,
            "set3": set3,
            "set4": set4
        ]
        //let vsetC = NSLayoutConstraint.constraintsWithVisualFormat("V:|[set1]|", options:[], metrics: nil, views: views)
        //NSLayoutConstraint.activateConstraints(vsetC)
        let hsetC = NSLayoutConstraint.constraintsWithVisualFormat("H:|[set1][set2(==set1)][set3(==set2)][set4(==set3)]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(hsetC)
        
        
        return cell
    }
}
