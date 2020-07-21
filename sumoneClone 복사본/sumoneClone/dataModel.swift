//
//  dataModel.swift
//  sumoneClone
//
//  Created by 최서연 on 2020/07/01.
//  Copyright © 2020 최서연. All rights reserved.
//

import Foundation
   
//유저 스트럭처
struct User {
    var name: String
    var birthday: String
    let bloodtype: String
    let loginwith: String //이거 이넘으로 하기
    //let Dday: Date
    
    let coupleMember: String
    //let questionTime: ? // 어떤 게 어울릴ㄹ지 고민
}
    
    
// answers 스트럭처
//struct Answer {
//    let answerFromMe:String
//    let answerFromOther:String
//}

    
// 질문 스트럭처
struct Question {
    let number: String
    let question: String
    var answerFromMe:String
    var answerFromOther:String
    }

    
enum AlarmType {
    case Answer
    case Reply
    case Question
}

struct Alarm {
    var type: AlarmType
    var text: String
    var recievedAt: DateComponents
}

let me = User(name: "서연", birthday: "2003-07-28", bloodtype: "AB", loginwith: "카카오톡",  coupleMember: "시아")

let alarms:[Alarm] = [
    Alarm(type: .Answer, text: "대답1", recievedAt: DateComponents(calendar: Calendar.current, year: 2019, month: 8, day: 19)),
    Alarm(type: .Question, text: "질문1", recievedAt: DateComponents(calendar: Calendar.current, year: 2019, month: 8, day: 19)),
    Alarm(type: .Reply, text: "답글1", recievedAt: DateComponents(calendar: Calendar.current, year: 2019, month: 8, day: 19)),
    Alarm(type: .Reply, text: "답글2", recievedAt: DateComponents(calendar: Calendar.current, year: 2013, month: 8, day: 19)),
    Alarm(type: .Question, text: "질문2", recievedAt: DateComponents(calendar: Calendar.current, year: 2000, month: 8, day: 19))
]


var questionList: [Question] = [
      Question(number: "01", question: "당신은 어떤 사람인지 소개해주세요. \nTMI도 좋아요!",answerFromMe: "얄라리", answerFromOther: "얄라"),
      Question(number: "02", question: "그 사람을 처음 마주했을 때 당신의 감정을 표현해보세요.",answerFromMe: "", answerFromOther: ""),
      Question(number: "03", question: "그 사람을 생각하면 떠오르는 노래가 있나요?",answerFromMe: "", answerFromOther: ""),
      Question(number: "04", question: "난 사실 너의 마음을 얻기 위해 ____했어",answerFromMe: "", answerFromOther: ""),
      Question(number: "05", question: "상대방과 닮은 동물은 무엇인가요?",answerFromMe: "", answerFromOther: "")
   ]

