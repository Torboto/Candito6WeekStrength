//
//  SetCell.swift
//  Candito 6 Week Strength
//
//  Created by Ern on 2016-03-13.
//  Copyright © 2016 ThoughtPond. All rights reserved.
//

import UIKit

class SetCell: UITableViewCell {
    
    var set1: UILabel = UILabel()
    var set2: UILabel = UILabel()
    var set3: UILabel = UILabel()
    var set4: UILabel = UILabel()
    
    var exercise: Exercise? {
        didSet {
            if let set = exercise?.Sets[0] {
                var setInfo = String(set.Weight)
                setInfo += " x"
                setInfo += String(set.Reps)
                set1.text = setInfo
            }
            if let set = exercise?.Sets[1] {
                var setInfo = String(set.Weight)
                setInfo += " x"
                setInfo += String(set.Reps)
                set2.text = setInfo
            } else {
                set2.text = ""
            }
            if let set = exercise?.Sets[2] {
                var setInfo = String(set.Weight)
                setInfo += " x"
                setInfo += String(set.Reps)
                set3.text = setInfo
            } else {
                set2.text = "---"
            }
            if let set = exercise?.Sets[3] {
                var setInfo = String(set.Weight)
                setInfo += " x"
                setInfo += String(set.Reps)
                set4.text = setInfo
            } else {
                set2.text = "---"
            }
            setNeedsLayout()
        }
    }

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        set1.font = UIFont.boldSystemFontOfSize(15)
        set1.textAlignment = .Center
        set1.sizeToFit()
        contentView.addSubview(set1)
        set2.font = UIFont.boldSystemFontOfSize(15)
        set2.textAlignment = .Center
        contentView.addSubview(set2)
        set3.font = UIFont.boldSystemFontOfSize(15)
        set3.textAlignment = .Center
        contentView.addSubview(set3)
        set4.font = UIFont.boldSystemFontOfSize(15)
        set4.textAlignment = .Center
        contentView.addSubview(set4)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let setWidth = (self.bounds.size.width / 4)
        
        self.set1.frame = CGRectMake(0, 0, setWidth, self.bounds.size.height)
        self.set2.frame = CGRectMake(setWidth, 0, setWidth, self.bounds.size.height)
        self.set3.frame = CGRectMake((setWidth * 2), 0, setWidth, self.bounds.size.height)
        self.set4.frame = CGRectMake((setWidth * 3), 0, setWidth, self.bounds.size.height)
        //let views = [
        //    "set1": set1,
        //    "set2": set2,
        //    "set3": set3,
        //    "set4": set4
        //]
        //let hsetC = NSLayoutConstraint.constraintsWithVisualFormat("H:|[set1][set2][set3][set4]|", options:[], metrics: nil, views: views)
        //NSLayoutConstraint.activateConstraints(hsetC)
    }
        
}

