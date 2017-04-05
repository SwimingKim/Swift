//
//  FirstListViewController.swift
//  Chapter19
//
//  Created by 김수영 on 2017. 4. 5..
//  Copyright © 2017년 SuYoung. All rights reserved.
//

import UIKit

class FirstListViewController : UITableViewController {

    var mlist = [MovieVO]()
    
    override func viewDidLoad() {
        
        /*
         var mvo = MovieVO()
         mvo.title = "다크나이트"
         mvo.description = "영웅물에 철학에 음악까지 더해져 예술이 되다"
         mvo.opendate = "2008-09-04"
         mvo.rating = 8.95
         
         self.list.append(mvo)
         
         mvo = MovieVO()
         mvo.title = "호우시절"
         mvo.description = "때를 알고 내리는 좋은 비"
         mvo.opendate = "2009-10-08"
         mvo.rating = 7.31
         
         self.list.append(mvo)
         
         mvo = MovieVO()
         mvo.title = "말할 수 없는 비밀"
         mvo.description = "여기서 너까지 다섯 걸음"
         mvo.opendate = "2015-05-07"
         mvo.rating = 9.19
         
         self.list.append(mvo)
         */
        
    }
    
    // 튜플 아이템으로 구성된 데이터 세트
    var dataset = [
        ("다크나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다", "2008-09-04", 8.95, "darknight.jpg"),
        ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31, "rain.jpg"),
        ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19, "secret.jpg"),
        ]
    
    
    // 테이블 뷰를 구성할 리스트 데이터
    lazy var list : [MovieVO] = {
        var datalist = [MovieVO]()
        
        for (title, desc, opendate, rating, thumbnail) in self.dataset {
            let mvo = MovieVO()
            
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating
            mvo.thumbnail = thumbnail
            
            datalist.append(mvo)
        }
        
        return datalist
    }()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 주어진 행에 맞는 데이터 소스를 읽어온다
        let row = self.list[indexPath.row]
        
        // 테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        /*
         cell.textLabel?.text = row.title
         cell.detailTextLabel?.text = row.description
         */
        
        /*
         let title = cell.viewWithTag(101) as? UILabel
         let desc = cell.viewWithTag(102) as? UILabel
         let opendate = cell.viewWithTag(103) as? UILabel
         let rating = cell.viewWithTag(104) as? UILabel
         */
        
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        cell.thumbnail.image = UIImage(named: row.thumbnail!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row)번째 행입니다.")
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}

