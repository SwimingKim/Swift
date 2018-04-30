//
//  SecondViewController.swift
//  Proj02_SignUp
//
//  Created by KimSuyoung on 2018. 4. 20..
//  Copyright © 2018년 KimSuyoung. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var ageLable: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("SecondViewController의 view가 메모리에 로드 됨")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameLable.text = UserInfomation.shared.name
        self.ageLable.text = UserInfomation.shared.age
        
        print("SecondViewController의 view가 화면에 보여질 예정")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("SecondViewController의 view가 화면에 보여짐")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("SecondViewController의 view가 화면에서 사라질 예정")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("SecondViewController의 view가 화면에서 사라짐")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("SecondViewController의 view가 subview를 레이아웃 하려함")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("SecondViewController의 view가 subview를 레이아웃 함")
    }
    
    @IBAction func popToPrev(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissModa(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
