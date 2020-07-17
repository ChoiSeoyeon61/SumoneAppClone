//
//  WriteAnswerView.swift
//  sumoneClone
//
//  Created by 최서연 on 2020/07/08.
//  Copyright © 2020 최서연. All rights reserved.
//

import UIKit

class WriteAnswerView: UIViewController, UITextViewDelegate {

    @IBOutlet weak var QuestionText: UILabel!
    @IBOutlet weak var QNumberAndTime: UILabel!
    @IBOutlet weak var AnswerView: UITextView!
    @IBOutlet weak var TextCount: UILabel!
    
     var receivedQuestion: Question?

    override func viewDidLoad() {
      // 텍슷뷰테두리
        AnswerView.layer.cornerRadius = 10
        AnswerView.layer.borderWidth = 1
        AnswerView.layer.borderColor = UIColor.black.cgColor
        
       // 질문이랑 질문 번호 띄우기.
        QuestionText.text = receivedQuestion?.question
        QNumberAndTime.text = receivedQuestion?.number
        super.viewDidLoad()
        
        // 아래 여러 기능 쓰려면.. delegate 필요
        AnswerView.delegate = self
        
        placeholderSetting()
    }
    
    // textView 바깥 터치하면 키보드 사라짐
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.AnswerView.resignFirstResponder()
    }
    
//    // textView 스트링 전 화면으로 넘기기(고장고장)
//    override func prepareForSegue(
//    segue: UIStoryboardSegue, sender: AnyObject?) {
//            let DestViewController
//             :  =
//                segue.destination as!
//              MeAndYouAnswerView
//
//            DestViewController.receivedAnswer =
//            AnswerView.text!
//        }
    
    //placeholder 만들기
    func placeholderSetting() {
             // txtvReview가 유저가 선언한 outlet
            AnswerView.text = "제가 바로 PlaceHolder입니다."
            AnswerView.textColor = UIColor.lightGray
        }

    // 텍슷뷰 터치하면 placeholder 텍스트 없게 하기
    func textViewDidBeginEditing(_ textView: UITextView) {
        if AnswerView.textColor == UIColor.lightGray {
            AnswerView.text = nil
            AnswerView.textColor = UIColor.black
        }
    }
    
    // 글자수 보여주기 & 100자 이하로 제한하기
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        TextCount.text = "\(AnswerView.text.count)/100"
        return AnswerView.text.count + (text.count - range.length) <= 100
        }
    
    // 키보드 내려올 때 호출 한 번 됨. 이 때 데이터 바꾸기
    func textViewDidEndEditing(_ textView: UITextView) {
        //MeAndYou(이하mym) 뷰랑 동일하게.. receivedQuestion 한 번 옵셔널 바인딩하기
        if let recevied = self.receivedQuestion {
            //mym뷰에서처럼 똑같이 enumarated() 걸기
            for question in questionList.enumerated() {
                if recevied.number == question.element.number {
                    // questionList 중 수정하고 있는 데이터 인덱스에 offset으로 이제 접근할 수 있음. 접근해서 Struct의 answerFromMe를 텍스트뷰의 텍스트로 바꿈.
                    questionList[question.offset].answerFromMe = textView.text
                }
            }
        }
       
    }
// topBar 버튼 두 개 pop 기능 넣기
    @IBAction func BackAction(_ sender: Any) {
        AnswerView.endEditing(true)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func EnterAction(_ sender: Any) {
        AnswerView.endEditing(true)
        self.navigationController?.popViewController(animated: true)
    }
    
}
//unwindsegue : 내가 내비 계통 원하는 부모 뷰에게 타겟 정해서 데이터 전달 가능.
