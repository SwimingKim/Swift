//
//  SecondViewController.swift
//  temp
//
//  Created by 김수영 on 2017. 3. 18..
//  Copyright © 2017년 SuYoung. All rights reserved.
//

import UIKit

class SecondViewController : UIViewController {
    
    
    @IBAction func dismiss(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
        
    }

    @IBAction func back2(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}

