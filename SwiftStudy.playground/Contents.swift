//: Playground - noun: a place where people can play

import UIKit

// 스위프트 공부하기

// ios는 Multitasking과 Sandbox 환경

// let과 var
let maxSpeed:Int = 200 // 상수
var currentSpeed:Int = 110 // 변수

// String과 Numbers
let name = "HelloWorld"
let count = name.characters.count
let hasH = name.hasPrefix("H")
print("name \(1)") // 문자와 숫자 섞어 쓰기
currentSpeed += Int(20.5) // 형변환

// Tuple : 코마로 구분된 값의 리스트
let time1 = (9, 0, 48)
let time2:(h:Int, m:Int, s:Int) = (11, 51, 5)
time2.h
let duration = (time1, time2)
let (start, end) = duration
end.h
// typealias : 간단한 타입의 지정
typealias Time = (h:Int, m:Int, s:Int)
typealias Duration = (start:Time, end:Time)
let today:Duration = ((9, 10, 23), (17, 8, 21))

// Collections - Array, Dictionay
// Array
var meetingRooms:Array<String> = ["A", "B", "C"]
var groups:[Int] = [4, 3, 5]
var copy = groups
groups += [6] // 복사방법
meetingRooms += ["D"] // 추가1
meetingRooms.append("E") // 추가2
meetingRooms[0] // 불러오기1
meetingRooms.last // 불러오기2
// Dictionay : 키와 값의 쌍으로 이루어진 컬렉션
var roomCapacity:[String:Int] = ["a":1, "b":2, "c":3]
roomCapacity["d"] = 4 // 추가방법
let roomNames = [String] (roomCapacity.keys)
let capacities = [Int] (roomCapacity.values)
// Set : 순서를 가지지 않은 컬렉션
let sub2:Set = ["강남", "양재", "을지로3가"]
let sub3:Set = ["구파발", "양재", "을지로3가", "대화"]
let transfer = sub2.intersection(sub3)
let union = sub2.union(sub3)

// if문
let number = 3
if (number > 0) {
    print("\(number) 숫자는 양수")
} else {
    print("\(number) 숫자는 정수")
}

// for문
for station in sub2 {
    print("이번 역은 \(station) 입니다")
}

// switch문
for (roomName, capacity) in roomCapacity {
    let roomDescription:String
    switch capacity {
    case 3:
        roomDescription = "작은 \(roomName) 정원은 \(capacity)"
    case 4...5:
        roomDescription = "\(roomName) 정원은 \(capacity)"
    case _ where capacity > 5 :
        roomDescription = "큰 \(roomName) 정원은 \(capacity)"
    default:
        roomDescription = "오류 발생"
    }
}

// optional
// Force Unwrqpping - ! : 값의 존재를 확신 할 때
// Optional Binding - if let, if var
// Implicitly Unwrapped Option - 선언부에 !
var ratings : [Double]! = nil
var supportURL : String? = "www.naver.com"
var bookDescription = "책 설명 = "
if (ratings != nil) {
    bookDescription += "has \(ratings.count) ratings"
}
if let theURL = supportURL {
    bookDescription += "web = \(theURL)"
}

// 함수
ratings = [4.5, 3.2, 5.6, 2.5]
func ratingRecord (history:[Double]) -> (average:Double, min:Double, max:Double) {
    var sum = 0.0, min = history[0], max = history[0]
    for value in history {
        if min > value {min = value}
        if max < value {max = value}
        sum += value
    }
    let average = sum / Double(history.count)
    return (average, min, max)
}
if let theRatings = ratings {
    let record = ratingRecord(history: theRatings)
    bookDescription += "has \(ratings.count) ratings \r\n average = \(record.average)"
}
if let theURL = supportURL {
    bookDescription += "web = \(theURL)"
}

