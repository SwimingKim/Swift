//
//  MovieCell.swift
//  Chapter19
//
//  Created by 김수영 on 2017. 4. 5..
//  Copyright © 2017년 SuYoung. All rights reserved.
//

import UIKit

class MovieCell : UITableViewCell {
    
    @IBOutlet var title: UILabel! // 영화 제목
    @IBOutlet var opendate: UILabel! // 영화 설명
    @IBOutlet var desc: UILabel! // 개봉일
    @IBOutlet var rating: UILabel! // 평점
    @IBOutlet var thumbnail: UIImageView! // 썸네일 이미지
    
}

