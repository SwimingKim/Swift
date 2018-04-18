//
//  SuperViewController.swift
//  Proj01_MusicPlayer
//
//  Created by KimSuyoung on 2018. 4. 18..
//  Copyright © 2018년 KimSuyoung. All rights reserved.
//

import UIKit

class SuperViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 60, y: 100, width: 240, height: 120)
        let subView = UIView(frame: frame)
        subView.backgroundColor = UIColor.black
        
        print("서브뷰의 프레임의 CGRect : \(subView.frame)")
        print("서브뷰의 바운드의 CGRect : \(subView.bounds)")
        print("서브뷰의 프레임 Origin : \(subView.frame.origin)")
        print("서브뷰의 바운드 Origin : \(subView.bounds.origin)")
        
        view.addSubview(subView)
        
//        subView.removeFromSuperview()
    }

}
