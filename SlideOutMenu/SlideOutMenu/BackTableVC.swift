//
//  BackTableVC.swift
//  SlideOutMenu
//
//  Created by 김수영 on 2017. 4. 9..
//  Copyright © 2017년 SuYoung. All rights reserved.
//

import Foundation

/*
 사이드메뉴 커스텀
 */
class BackTableVC : UITableViewController {
    var TableArray = [String]()
    
    override func viewDidLoad() {
        TableArray = ["iOS", "Swift", "Project"]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = TableArray[indexPath.row]
        
        
        return cell
    }
}
