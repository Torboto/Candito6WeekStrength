//
//  TodaysWorkoutViewController.swift
//  Candito 6 Week Strength
//
//  Created by Ern on 2016-03-12.
//  Copyright © 2016 ThoughtPond. All rights reserved.
//

import Foundation
import UIKit

let plan = Plan.sharedInstance

class TodaysWorkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = plan.TodaysWorkout?.Type
        
        let dateFormat = NSDateFormatter()
        dateFormat.dateStyle = NSDateFormatterStyle.FullStyle

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = dateFormat.stringFromDate(plan.TodaysWorkout!.Date)
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.boldSystemFontOfSize(25)
        titleLabel.textAlignment = .Center
        titleLabel.sizeToFit()
        self.view.addSubview(titleLabel)
        
        let viewWeek = UIButton()
        viewWeek.translatesAutoresizingMaskIntoConstraints = false
        viewWeek.setTitle("Workout Week", forState: .Normal)
        viewWeek.backgroundColor = UIColor.blueColor()
        viewWeek.layer.cornerRadius = 5
        viewWeek.layer.borderWidth = 1
        viewWeek.layer.borderColor = UIColor.blueColor().CGColor
        viewWeek.addTarget(self, action: Selector("viewWeekTapped:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(viewWeek)
        
        //let workoutTableViewController = WorkoutTableViewController()
        //self.addChildViewController(workoutTableViewController)
        let workoutTableView = UITableView(frame: CGRectZero, style: .Grouped)
        workoutTableView.translatesAutoresizingMaskIntoConstraints = false
        //workoutTableView.frame = CGRect(x: 0, y: 160, width: view.frame.width, height: view.frame.height)
        workoutTableView.delegate = self
        workoutTableView.dataSource = self
        workoutTableView.scrollEnabled = false
        workoutTableView.sizeToFit()
        //self.view.backgroundColor = UIColor.blueColor()
        self.view.addSubview(workoutTableView)
        workoutTableView.tableHeaderView = titleLabel
        
        
        let views = [
            //"navBar": self.navigationController?.topLayoutGuide,
            "titleLabel": titleLabel,
            "workoutTableView": workoutTableView,
            "viewWeek": viewWeek,
        ]
        
        // Collect all constraints to send to the superview
        
        //let vtitleLabelC = NSLayoutConstraint.constraintsWithVisualFormat("V:|-70-[titleLabel]", options:[], metrics: nil, views: views)
        let vtitleLabelC = NSLayoutConstraint.constraintsWithVisualFormat("V:|[titleLabel]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vtitleLabelC)
        let htitleLabelC = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[titleLabel]-|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(htitleLabelC)
        let xtitleLabelC = NSLayoutConstraint(item: titleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(xtitleLabelC)
        
        let vviewWeekC = NSLayoutConstraint.constraintsWithVisualFormat("V:|-74-[workoutTableView]-[viewWeek]-10-|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(vviewWeekC)
        let hviewWeekC = NSLayoutConstraint.constraintsWithVisualFormat("H:|[workoutTableView]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(hviewWeekC)
        let hworkoutTableViewC = NSLayoutConstraint.constraintsWithVisualFormat("H:|[workoutTableView]|", options:[], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(hworkoutTableViewC)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false)
        //counterLabel.text = "The counter was tapped \(numberToDisplay) times."
    }
    
    func viewWeekTapped(sender: UIButton) {
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return plan.TodaysWorkout!.Exercises.count
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel()
        headerLabel.font = UIFont.boldSystemFontOfSize(18)
        headerLabel.text = plan.TodaysWorkout?.Exercises[section].Name
        headerLabel.backgroundColor = UIColor.lightGrayColor()
        tableView.addSubview(headerLabel)
        return headerLabel
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 22
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return plan.TodaysWorkout!.Exercises[section].Sets.count
        return 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return plan.TodaysWorkout?.Exercises[section].Name
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
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