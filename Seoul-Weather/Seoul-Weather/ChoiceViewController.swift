//
//  ChoiceViewController.swift
//  Seoul-Weather
//
//  Created by KimSuyoung on 13/06/2018.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let nextViewController = segue.destination as? MapViewController {
            nextViewController.loadMapView(identifier: segue.identifier)
        }
        
    }
}
