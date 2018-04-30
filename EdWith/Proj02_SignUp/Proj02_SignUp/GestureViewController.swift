//
//  GestureViewController.swift
//  Proj02_SignUp
//
//  Created by KimSuyoung on 2018. 5. 1..
//  Copyright © 2018년 KimSuyoung. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        print("Tapped")
    }
    
    @objc func tapView(gestureRecognizer: UIGestureRecognizer) {
        print("Tapped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 액션 타깃을 통한 제스처 인식기 초기화 및 생성
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView(gestureRecognizer:)))
        self.view.addGestureRecognizer(tapRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
