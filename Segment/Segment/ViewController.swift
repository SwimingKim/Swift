//
//  ViewController.swift
//  Segment
//
//  Created by 김수영 on 2017. 3. 18..
//  Copyright © 2017년 SuYoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func wind(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualWind", sender: self)
        
    }
    
    @IBAction func unwindToVC (_ segue:UIStoryboardSegue) {
    }
    
    @IBAction func gotoPage1 (_ sender:UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("세그웨이가 곧 실행됩니다")
    }

    
    

}

