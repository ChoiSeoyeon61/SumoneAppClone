//
//  mainViewController.swift
//  sumoneClone
//
//  Created by 최서연 on 2020/06/30.
//  Copyright © 2020 최서연. All rights reserved.
//

import UIKit

class mainViewController: UIViewController {

    @IBOutlet var coupleName: UILabel!
    @IBOutlet var Dday: UILabel!
    @IBOutlet var questionLable: UILabel!
    
    
// 달력 / 데이터포매터 init
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    
    
 

    //let todayDday =
    
    
   
    
   

    
//    let ourDDay = DateComponents(calendar: calendar, year: 2020, month: 6, day: 1)
//    let today = Date()
//    let todayTime = calendar.dateComponents([.year,.month,.day], from: today)

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.title = "Sumone"
        
        let dday = DateComponents(calendar: calendar, year: 2013, month: 8, day: 19)
        
        let currentTime = Date()
        
        let currentTimeYMD = calendar.dateComponents([.year,.month,.day], from: currentTime)
        
        let fromDdayToToday = calendar.dateComponents([.day], from: dday, to: currentTimeYMD)
        
        if case let (day?) = ( fromDdayToToday.day) {
          Dday.text = "사랑한 지 \(day+1)일 째"
          
        }
        
        coupleNames()
      todayQuestion()
        // Do any additional setup after loading the view.
    }
    

     
    func coupleNames() {
        coupleName.text = "\(me.name)❤️\(me.coupleMember)"
    }
    func dDay() {
       
    }
    func todayQuestion() {
      
        questionLable.text = questionList[1].question
    }
    
    @IBAction func AlarmAction(_ sender: Any) {
        performSegue(withIdentifier: "goToAlarm", sender: nil)
    }
}

