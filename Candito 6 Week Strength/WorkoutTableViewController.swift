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
    //    tableView.dataSource = self;
    //    tableView.delegate = self;
    ////    
    ////    tableView.registerClass(SetCell.self, forCellReuseIdentifier: "SetCell")
    //}
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return plan.TodaysWorkout!.Exercises.count
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel()
        headerLabel.font = UIFont.boldSystemFontOfSize(18)
        headerLabel.text = plan.TodaysWorkout?.Exercises[section].Name
        headerLabel.backgroundColor = UIColor.lightGrayColor()
        tableView.addSubview(headerLabel)
        return headerLabel
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return plan.TodaysWorkout!.Exercises[section].Sets.count
        return 1
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return plan.TodaysWorkout?.Exercises[section].Name
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //tableView.dataSource = self
        //tableView.registerClass(SetCell.self, forCellReuseIdentifier: "SetCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let cell = UITableViewCell()
        //let cell = tableView.dequeueReusableCellWithIdentifier( "SetCell", forIndexPath: indexPath) as! SetCell
        //cell.exercise = plan.TodaysWorkout!.Exercises[indexPath.section]
        cell.selectionStyle = .None
        
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
        var set3Info = String(exercise.Sets[2].Weight)
        set3Info += " x"
        set3Info += String(exercise.Sets[2].Reps)
        set3.text = set3Info
        var set4Info = String(exercise.Sets[3].Weight)
        set4Info += " x"
        set4Info += String(exercise.Sets[3].Reps)
        set4.text = set4Info
        
        let views = [
            "set1": set1,
            "set2": set2,
            "set3": set3,
            "set4": set4
        ]
        let vset1C = NSLayoutConstraint.constraintsWithVisualFormat("V:|[set1]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vset1C)
        let vset2C = NSLayoutConstraint.constraintsWithVisualFormat("V:|[set2]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vset2C)
        let vset3C = NSLayoutConstraint.constraintsWithVisualFormat("V:|[set3]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vset3C)
        let vset4C = NSLayoutConstraint.constraintsWithVisualFormat("V:|[set4]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vset4C)
        let hsetC = NSLayoutConstraint.constraintsWithVisualFormat("H:|[set1][set2(==set1)][set3(==set2)][set4(==set3)]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(hsetC)
        
        
        return cell
    }
}
