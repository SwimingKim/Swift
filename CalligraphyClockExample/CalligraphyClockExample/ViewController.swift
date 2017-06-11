//
//  ViewController.swift
//  CalligraphyClockExample
//
//  Created by 김수영 on 2017. 6. 10..
//  Copyright © 2017년 김수영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var h1: UIImageView!
    @IBOutlet weak var h2: UIImageView!
    @IBOutlet weak var hourChar: UIImageView!
    @IBOutlet weak var m1: UIImageView!
    @IBOutlet weak var m2: UIImageView!
    @IBOutlet weak var m3: UIImageView!
    @IBOutlet weak var minChar: UIImageView!
    @IBOutlet weak var s1: UIImageView!
    @IBOutlet weak var s2: UIImageView!
    @IBOutlet weak var s3: UIImageView!
    @IBOutlet weak var secChar: UIImageView!
    @IBOutlet weak var fullDisplay: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let language = Locale.preferredLanguages[0]
        var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        updateTime(timer)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateTime(_ timer: Timer? = nil) {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: date)
        let hour = components.hour! <= 12 ? components.hour : components.hour! - 12
        let minutes = components.minute
        let seconds = components.second
        let hours : Array = ["영", "한", "두", "세", "네", "다섯", "여섯", "일곱", "여덟", "아홉", "열", "열 한", "열 두"]
        let numbers : Array = ["영", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구", "십"]
        
        let timestamp = DateFormatter.localizedString(from: date, dateStyle: .none, timeStyle: .medium)
        fullDisplay.text = timestamp
        
        if hours[hour!].characters.count > 1 {
            h1.image = UIImage(named: "\(hours[hour!].characters.first!).png")
            h2.image = UIImage(named: "\(hours[hour!].characters.last!).png")
        } else {
            h1.image = UIImage()
            h2.image = UIImage(named: "\(hours[hour!]).png")
        }
        hourChar.image = UIImage(named: "시.png")
        
        if (minutes! < 10) {
            m1.image = UIImage()
            m2.image = UIImage()
            m3.image = UIImage(named: "\(numbers[minutes!]).png")
        } else if minutes! < 20 {
            m1.image = UIImage()
            m2.image = UIImage(named: "\(numbers[10]).png")
            m3.image = UIImage(named: "\(numbers[minutes!%10]).png")
        } else {
            if minutes! % 10 == 0 {
                m1.image = UIImage()
                m2.image = UIImage(named: "\(numbers[minutes!/10]).png")
                m3.image = UIImage(named: "\(numbers[10]).png")
            } else {
                m1.image = UIImage(named: "\(numbers[minutes!/10]).png")
                m2.image = UIImage(named: "\(numbers[10]).png")
                m3.image = UIImage(named: "\(numbers[minutes!%10]).png")
            }
        }
        minChar.image = UIImage(named: "분.png")
//        minChar.contentMode = UIViewContentMode.scaleAspectFill
        
        if seconds! <= 10 {
            s1.image = UIImage()
            s2.image = UIImage()
            s3.image = UIImage(named: "\(numbers[seconds!]).png")
        } else if seconds! < 20 {
            s1.image = UIImage()
            s2.image = UIImage(named: "\(numbers[10]).png")
            s3.image = UIImage(named: "\(numbers[seconds!%10]).png")
        } else {
            if seconds! % 10 == 0 {
                s1.image = UIImage()
                s2.image = UIImage(named: "\(numbers[seconds!/10]).png")
                s3.image = UIImage(named: "\(numbers[10]).png")
            } else {
                s1.image = UIImage(named: "\(numbers[seconds!/10]).png")
                s2.image = UIImage(named: "\(numbers[10]).png")
                s3.image = UIImage(named: "\(numbers[seconds!%10]).png")
            }
        }
        secChar.image = UIImage(named: "초.png")
        
        if timer != nil && String(describing: timer?.userInfo).range(of: "ko") == nil {
            fullDisplay.text = timestamp
        } else {
            fullDisplay.text = ""
        }
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
