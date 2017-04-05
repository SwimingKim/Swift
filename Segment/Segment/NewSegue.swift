//
//  NewSegue.swift
//  Segment
//
//  Created by 김수영 on 2017. 3. 18..
//  Copyright © 2017년 SuYoung. All rights reserved.
//

import UIKit

class NewSegue : UIStoryboardSegue {
    
    override func perform() {
        let srcUVC = self.source
        let destUVC = self.destination
        
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlDown)
        
    }

}
