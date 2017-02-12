//
//  ViewController.swift
//  MoneyConverter
//
//  Created by 김수영 on 2017. 2. 12..
//  Copyright © 2017년 SuYoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currencySegment: UISegmentedControl!
    
    @IBOutlet weak var sourceMoneyField: UITextField!
    
    @IBOutlet weak var targetMoneyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func convertMoney(_ sender: Any) {
        //        let ratio : Double
        //        switch currencySegment.selectedSegmentIndex {
        //        case 0:
        //            ratio = 0.00085
        //        case 1:
        //            ratio = 1178.5
        //        default:
        //            ratio = 1.0
        //        }
        //
        //        let targetMoneyString : String
        //        if let sourceMoney = Double(sourceMoneyField.text!) {
        //            targetMoneyString = "\(sourceMoney * ratio)"
        //        } else {
        //            targetMoneyString = "Error"
        //        }
        
        guard let sourceCurrency = Currency(rawValue: currencySegment.selectedSegmentIndex) else {
            print("Source Currency Error")
            return
        }
        
        guard let sourceAccount = Double(sourceMoneyField.text!) else {
            targetMoneyLabel.text = "Error"
            return
        }
        
        let sourceMoney = Money(sourceAccount, currency: sourceCurrency)
        
        var targetMoneyString = ""
        for i in 0..<4 {
            targetMoneyString += sourceMoney.valueInCurrency(Currency.init(rawValue: i)!)
            targetMoneyString += "\r\n"
        }
        
        targetMoneyLabel.text = targetMoneyString
    }
    
}

