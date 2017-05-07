//
//  ViewController.swift
//  SlideOutMenu
//
//  Created by 김수영 on 2017. 4. 9..
//  Copyright © 2017년 SuYoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Open: UIBarButtonItem!
    
    var varView = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
        
        // 왼쪽 화면 드래그로 사이드 메뉴 열기
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

