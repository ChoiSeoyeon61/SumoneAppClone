//
//  MeAndYouAnswerView.swift
//  sumoneClone
//
//  Created by 최서연 on 2020/07/08.
//  Copyright © 2020 최서연. All rights reserved.
//

import UIKit

class MeAndYouAnswerView: UIViewController {
    @IBOutlet weak var Question: UILabel!
    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var myAnswer: UILabel!
    @IBOutlet weak var yourName: UILabel!
    @IBOutlet weak var yourAnswer: UILabel!
    @IBOutlet weak var writeAnswer: UIButton!
    @IBOutlet weak var goReply: UIButton!
    @IBAction func goBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    var receivedQuestion: Question?
    
    var receivedAnswer: String?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //viewDidLoad는 처음에 화면이 불러와졌을 때만 실행됨. viewWillAppear은 화면이 불러와질 때마다 실행됨. 고로 이 앱에는 뷰윌어피어가 적당. 그리고 오버라이드 함수는 절대 파라미터 등 뭐든 아무것도 수정하면 안 됨. 그냥 그대로 놔두어야 하고, 새로 캐스팅이 필요하면 함수 내에서 해야 함.
    override func viewWillAppear(_ animated: Bool) {
        //received 새로고침하는 함수. questionList는 앞에서 변경이 되었지만, received는 아님. received를 바꿔줘야 답변 화면에 입력한 텍스트가 올라감. 왜냐면 received가 myAnswer.text기 때문이죠
        // 먼저 if let문으로 옵셔널 검사해줌, optional binding.
        if let received = self.receivedQuestion {
            // for문으로 questionList 루프를 돌면서, receivedQuestion에서 받은 질문 번호랑 같은 번호의 데이터 골라냄.
            //enumerated() 메소드 : 배열의 데이터와 그 배열의 인덱스 정보를 같이 가져옴. enumerated()를 쓰면 중간에 프라퍼티가 한 단계 낌. element와 offset. element는 딱 데이터고, offset은 번호. 그 중 offset은 뒤에 가서 WriteAnswerView에 쓰임.
            for question in questionList.enumerated() {
                if received.number == question.element.number {
                    print(receivedQuestion)
                    self.receivedQuestion = question.element
                    print(receivedQuestion)
                }
            }
        }
        
        Question.text = receivedQuestion?.question
        myName.text = me.name
        yourName.text = me.coupleMember
        myAnswer.text = receivedQuestion?.answerFromMe
        yourAnswer.text = receivedQuestion?.answerFromOther
    }
// Question 데이터를 다음 Write 뷰로 넘김. 절대 오버라이드함수 틀 건드리지 말자.. 캐스팅은 안에서.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //연결되는 화면 세그가 write~라면,
          if segue.identifier == "WriteAnswerSegue" {
            //destination, 그러니까 데이터 보낼 곳은 세그 목적지인 WriteAnswerView임
              let destination = segue.destination as! WriteAnswerView
            // as Question에서 캐스팅 진행됨.
            //만약 self.receivedQuestion이 nil이 아니라면 question을 위 목적지 안의(?)receivedQuestion이라고 할당
            if let question = self.receivedQuestion {
                  destination.receivedQuestion = question
              }
          }
       }

    @IBAction func WriteAction(_ sender: Any?) {
        //세그 작동하게 해서 화면 넘어가기. performSegue(ident,sender)이 화면 넘어가게 해줌. sender nil인 이유 : 보통 performsegue를 테이블 뷰에서 자주 쓰잖야? 테이블 뷰는 보낼 데이터가 정해져 있지 않기 때문에 sender를 뭐라고 해야 함. 근데 여기에서는 뭘 보내줘야 할지가 정해져 있으니까.. 여기에서는 그냥 화면만 바꾸면 되는 거임.
        performSegue(withIdentifier: "WriteAnswerSegue", sender: nil)
    }
}
