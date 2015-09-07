//
//  ViewController.swift
//  tips
//
//  Created by Anand Gupta on 9/7/15.
//  Copyright (c) 2015 walmartlabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text="$0.00"
        totalLabel.text="$0.00"
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultSegmentIndex = defaults.integerForKey("defaultSegmentIndex")
        tipControl.selectedSegmentIndex = defaultSegmentIndex
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultSegmentIndex = defaults.integerForKey("defaultSegmentIndex")
        tipControl.selectedSegmentIndex = defaultSegmentIndex
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.15, 0.20, 0.30]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text="$\(tip)"
        totalLabel.text="$\(total)"
        tipLabel.text=String(format: "$%.2f", tip)
        totalLabel.text=String(format: "$%.2f", total)
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

