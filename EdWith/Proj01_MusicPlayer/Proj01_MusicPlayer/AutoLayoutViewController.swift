//
//  AutoLayoutViewController.swift
//  Proj01_MusicPlayer
//
//  Created by KimSuyoung on 2018. 4. 18..
//  Copyright © 2018년 KimSuyoung. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var constraintX: NSLayoutConstraint
        constraintX = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        var constraintY: NSLayoutConstraint
        constraintY = button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        constraintX.isActive = true
        constraintY.isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        var buttonConstraintX: NSLayoutConstraint
        buttonConstraintX = label.centerXAnchor.constraint(equalTo: button.centerXAnchor)
        
        var topConstraint: NSLayoutConstraint
        topConstraint = label.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -10)
        
        buttonConstraintX.isActive = true
        topConstraint.isActive = true
        
        var widthConstraint: NSLayoutConstraint
        widthConstraint = label.widthAnchor.constraint(equalTo: button.widthAnchor, multiplier: 2.0)
        
        label.backgroundColor = UIColor.brown
        button.backgroundColor = UIColor.blue
        
        widthConstraint.isActive = true
    }

}
