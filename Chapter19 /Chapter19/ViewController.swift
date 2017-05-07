//
//  ViewController.swift
//  Chapter19
//
//  Created by 김수영 on 2017. 4. 5..
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

    @IBAction func moveFirst(_ sender: Any) {
        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "FirstVC")
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(uvc, animated: true)
    }

    @IBAction func moveSecond(_ sender: Any) {
        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "SecondVC")
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(uvc, animated: true)
    }
}

