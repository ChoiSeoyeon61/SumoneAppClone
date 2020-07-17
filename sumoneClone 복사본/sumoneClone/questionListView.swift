//
//  questionListView.swift
//  sumoneClone
//
//  Created by 최서연 on 2020/07/07.
//  Copyright © 2020 최서연. All rights reserved.
//

import UIKit

class tableViewCell: UITableViewCell {
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionText: UILabel!

    var alarm: Alarm? = nil
    
    override func draw(_ rect: CGRect) {
        switch alarm?.type {
        case .Answer:
            break
        default:
            break
        }
    }
}

class questionListView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //Question 데이터
   

    //1. 테이블에 섹션 몇 개?
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // 2. 각 섹션마다 셀이 몇 개?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionList.count
    }

    // 3. 각 섹션과 셀마다 어떤 셀을 그려줘야 되는가?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          // Swift Optional
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionListCell", for: indexPath) as! tableViewCell
        let list:Question

        list = questionList[indexPath.row]
        cell.questionNumber.text = list.number
        cell.questionText.text = list.question

      return cell
    }
      
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataToSend: Question
        dataToSend = questionList[indexPath.row]
        self.performSegue(withIdentifier: "goToAnswer", sender: dataToSend)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "goToAnswer" {
           let destination = segue.destination as! MeAndYouAnswerView
           if let question = sender as? Question {
               destination.receivedQuestion = question
           }
       }
    }
      
    
    @IBOutlet weak var QuestionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 self.QuestionTableView.dataSource = self
self.QuestionTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
  
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
