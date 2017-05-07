//
//  ViewController.swift
//  temp
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
    
    @IBAction func moveNext(_ sender: Any) {
        
        //        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "SecondVC")
        //        uvc.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        //        self.present(uvc, animated: true)
        
        //        if let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") {
        //            uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        //            self.present(uvc, animated: true)
        //        }
        
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        self.present(uvc, animated: false)
        
    }
    
    @IBAction func moveByNavi(_ sender: Any) {
        
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        self.navigationController?.pushViewController(uvc, animated: false)
        
    }
    
}

