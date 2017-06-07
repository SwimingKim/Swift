//
//  ViewController.swift
//  InterfaceBuilderExample
//
//  Created by 김수영 on 2017. 6. 3..
//  Copyright © 2017년 김수영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchAction(_ sender: UIButton) {
        // 레이블의 텍스트를 변경하는 코드
        label.text = "Hello Guys!";
    }

}

