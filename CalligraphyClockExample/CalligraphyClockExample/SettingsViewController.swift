//
//  SettingsViewController.swift
//  CalligraphyClockExample
//
//  Created by 김수영 on 2017. 6. 12..
//  Copyright © 2017년 김수영. All rights reserved.
//

import UIKit
import EventKit

class SettingsViewController : UITableViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    var eventStore : EKEventStore?
    
    override func viewDidLoad() {
        let saveBtn : UIBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.plain, target: self, action: #selector(saveSettings))
        self.navigationItem.rightBarButtonItem = saveBtn
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let currentDate = Date()
        datePicker.minimumDate = currentDate
    }
    
    
    
    func saveSettings() {
        if self.eventStore == nil {
            self.eventStore = EKEventStore()
            self.eventStore!.requestAccess(to: EKEntityType.reminder, completion: { (isAccessible, errors) in })
        }
        
        let predicateForEvents : NSPredicate = self.eventStore!.predicateForReminders(in: [self.eventStore!.defaultCalendarForNewReminders()])
        self.eventStore!.fetchReminders(matching: predicateForEvents, completion: { (reminders) in
            for reminder in reminders! {
                if reminder.title == "Calli Alarm" {
                    do {
                        try self.eventStore!.remove(reminder, commit: true)
                    } catch {
                        
                    }
                }
            }
        })
        
        if alarmSwitch.isOn {
            let reminder = EKReminder(eventStore: self.eventStore!)
            reminder.title = "Calli Alarm"
            reminder.calendar = self.eventStore!.defaultCalendarForNewReminders()
            
            let alarm = EKAlarm(absoluteDate: datePicker.date)
            reminder.addAlarm(alarm)
            
            do {
                try self.eventStore!.save(reminder, commit: true)
            } catch {
                NSLog("알람 설정 실패")
            }
        }
    }
    
}
