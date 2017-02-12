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

// Structure
struct Task {
    var title:String
    var time:Int?
}
var callTask = Task(title: "Call to Randy", time: 10*60)
var reportTask = Task(title: "Report to Boss", time: nil)
var todayTask:[Task] = []
todayTask += [callTask, reportTask]
todayTask[1].time = 15*60
callTask.title = "Call to Tady"
print("today task = \(todayTask)")

// Class
class Employee {
    var name : String?
    var phoneNumber : String?
    var boss : Employee?
}
struct myTask {
    var title:String
    var time:Int?
    var owner : Employee
    var participant : Employee?
}
let me : Employee = Employee()
me.name = "Alex"
me.phoneNumber = "010-9622-0213"
let toby = Employee()
toby.name = "Toby"
toby.phoneNumber = "010-1234-5678"
var mycallTask = myTask(title: "Call to Randy", time: 10*60, owner: me, participant:toby)
print(toby.phoneNumber)
mycallTask.participant?.phoneNumber = "010-9876-5432"
print(toby.phoneNumber)

// Enumerations
struct newTask {
    var title:String
    var time:Int?
    var owner : Employee
    var participant : Employee?
    var type : TaskType
    enum TaskType {
        case Call
        case Report
        case Meet
        case Support
        var typeTitile:String {
            get {
                let tiltleString:String
                switch self {
                case .Call:
                    tiltleString = "Call"
                case .Report:
                    tiltleString = "Report"
                case .Meet:
                    tiltleString = "Meet"
                case .Support:
                    tiltleString = "Support"
                }
                return tiltleString
            }
        }
    }
}
var newreportTask = newTask(title: "Report to Boss", time: nil, owner : me, participant:toby, type:newTask.TaskType.Report)

// Initialize
struct renewTask {
    var title:String
    var time:Int?
    var owner : Employee
    var participant : Employee?
    var type : TaskType
    enum TaskType {
        case Call
        case Report
        case Meet
        case Support
        var typeTitile:String {
            get {
                let tiltleString:String
                switch self {
                case .Call:
                    tiltleString = "Call"
                case .Report:
                    tiltleString = "Report"
                case .Meet:
                    tiltleString = "Meet"
                case .Support:
                    tiltleString = "Support"
                }
                return tiltleString
            }
        }
    }
    init(type:TaskType, owner:Employee) {
        self.type = type
        self.title = type.typeTitile
        self.owner = owner
        self.time = nil
        self.participant = nil
    }
}
var renewcallTask = renewTask(type: .Call, owner: me)
renewcallTask.time = 10*60
class renewEmployee {
    var name : String?
    var phoneNumber : String?
    var boss : Employee?
    init(name:String) {
        self.name = name
    }
    convenience init(name:String, phone:String) {
        self.init(name:name)
        self.phoneNumber = phone
    }
}
let man:renewEmployee = renewEmployee(name: "Alex", phone: "010-2222-4444")

// Method
class nowEmployee {
    var name : String?
    var phoneNumber : String?
    var boss : nowEmployee?
    init(name:String) {
        self.name = name
    }
    convenience init(name:String, phone:String) {
        self.init(name:name)
        self.phoneNumber = phone
    }
    func report() {
        if let myBoss = boss {
            print("\(self.name) reported to \(myBoss.name)")
        } else {
            print("\(name) don't have boss")
        }
    }
    func callTaskToBoss() -> nowTask? {
        if let myBoss = boss, let callTo = myBoss.phoneNumber {
            var callTask = nowTask(type: .Call, owner: self)
            return callTask
        }
        return nil
    }
}
struct nowTask {
    var title:String
    var time:Int?
    var owner : nowEmployee
    var participant : nowEmployee?
    var type : TaskType
    enum TaskType {
        case Call
        case Report
        case Meet
        case Support
        var typeTitile:String {
            get {
                let tiltleString:String
                switch self {
                case .Call:
                    tiltleString = "Call"
                case .Report:
                    tiltleString = "Report"
                case .Meet:
                    tiltleString = "Meet"
                case .Support:
                    tiltleString = "Support"
                }
                return tiltleString
            }
        }
    }
    init(type:TaskType, owner:nowEmployee) {
        self.type = type
        self.title = type.typeTitile
        self.owner = owner
        self.time = nil
        self.participant = nil
    }
}
let now = nowEmployee(name: "Alex", phone: "010-9999-8888")
now.report()
var nTask:[nowTask] = []
var nowreportTask = nowTask(type: .Report, owner: now)
nTask += [nowreportTask]
if let callTask = now.callTaskToBoss() {
    nTask += [callTask]
}

// Enum Associated Value
class finalEmployee {
    var name : String?
    var phoneNumber : String?
    var boss : nowEmployee?
    init(name:String) {
        self.name = name
    }
    convenience init(name:String, phone:String) {
        self.init(name:name)
        self.phoneNumber = phone
    }
    func report() {
        if let myBoss = boss {
            print("\(self.name) reported to \(myBoss.name)")
        } else {
            print("\(name) don't have boss")
        }
    }
    func callTaskToBoss() -> finalTask? {
        if let myBoss = boss, let callTo = myBoss.phoneNumber {
            var callTask = finalTask(type: .Call(number: callTo), owner: self)
            return callTask
        }
        return nil
    }
}
struct finalTask {
    var title:String
    var time:Int?
    var owner : finalEmployee
    var type : TaskType
    enum TaskType {
        case Call(number:String)
        case Report(to:finalEmployee, when:String)
        case Meet(with:finalEmployee, location:String)
        case Support(who:finalEmployee, Duration:Int)
        var typeTitile:String {
            get {
                let tiltleString:String
                switch self {
                case .Call:
                    tiltleString = "Call"
                case .Report:
                    tiltleString = "Report"
                case .Meet:
                    tiltleString = "Meet"
                case .Support:
                    tiltleString = "Support"
                }
                return tiltleString
            }
        }
    }
    init(type:TaskType, owner:finalEmployee) {
        self.type = type
        self.title = type.typeTitile
        self.owner = owner
        self.time = nil
    }
    func doBasicTask() -> String {
        let finaltaskDescription:String
        switch type {
        case .Call(let number):
            finaltaskDescription = "call to \(number)"
        case .Report(let receiver, let time):
            finaltaskDescription = "report to \(receiver) when \(time)"
        default:
            finaltaskDescription = "no information"
        }
        return finaltaskDescription
    }
}
var final = finalEmployee(name: "Haha")
var finalReport = finalTask(type: .Call(number:"000-111-2222"), owner: final)
finalReport.doBasicTask()

