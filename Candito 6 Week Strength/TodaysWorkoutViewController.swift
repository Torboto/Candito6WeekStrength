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

class TodaysWorkoutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.title = plan.TodaysWorkout!.Type

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = plan.Week1?.Name
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.boldSystemFontOfSize(25)
        titleLabel.textAlignment = .Center
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
        
        let workoutTableViewController = WorkoutTableViewController()
        let workoutTableView = workoutTableViewController.tableView
        workoutTableView.translatesAutoresizingMaskIntoConstraints = false
        workoutTableView.scrollEnabled = false
        workoutTableView.tableHeaderView = titleLabel
        workoutTableView.tableFooterView = viewWeek
        workoutTableView.sizeToFit()
        self.view.addSubview(workoutTableView)
        

        
        
        let views = [
            //"navBar": self.navigationController?.topLayoutGuide,
            "titleLabel": titleLabel,
            "workoutTableView": workoutTableView,
            "viewWeek": viewWeek,
        ]
        
        // Collect all constraints to send to the superview
        
        //let vtitleLabelC = NSLayoutConstraint.constraintsWithVisualFormat("V:|-70-[titleLabel][workoutTableView]-20-[viewWeek]", options:[], metrics: nil, views: views)
        //let vtitleLabelC = NSLayoutConstraint.constraintsWithVisualFormat("V:|-70-[workoutTableView]", options:[], metrics: nil, views: views)
        //NSLayoutConstraint.activateConstraints(vtitleLabelC)
        //let xtitleLabelC = NSLayoutConstraint(item: titleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        //self.view.addConstraint(xtitleLabelC)
        //
        //let hworkoutTableViewC = NSLayoutConstraint.constraintsWithVisualFormat("H:|[workoutTableView]|", options:[], metrics: nil, views: views)
        //NSLayoutConstraint.activateConstraints(hworkoutTableViewC)

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
}