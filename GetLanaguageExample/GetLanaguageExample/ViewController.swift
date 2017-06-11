//
//  ViewController.swift
//  GetLanaguageExample
//
//  Created by 김수영 on 2017. 6. 10..
//  Copyright © 2017년 김수영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var preferLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        preferLabel.text = "Language: \(Locale.preferredLanguages[0]) Locale: \((Locale.current as NSLocale).object(forKey: .countryCode)!)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

