//
//  AlarmViewController.swift
//  sumoneClone
//
//  Created by 최서연 on 2020/07/08.
//  Copyright © 2020 최서연. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var alarmTableView: UITableView!
    @IBOutlet weak var alarmText: UILabel!
    
    @IBOutlet weak var timeText: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var alarmImage: UIImageView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let calendar = Calendar.current
        let alarmTime = alarms[indexPath.row].recievedAt
        
        let currentTime = Date()
        
        let currentTimeYMD = calendar.dateComponents([.year,.month,.day], from: currentTime)
        
        let fromDdayToToday = calendar.dateComponents([.day], from: alarmTime, to: currentTimeYMD)
        
        if case let (day?) = ( fromDdayToToday.day) {
            timeText.text = "\(day)일 전"
        }
          
        alarmText.text = alarms[indexPath.row].text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = alarms[indexPath.row]
        let datatoSend: Question
        
        switch selected.type {
        case .Answer:
            break
        case .Question:
            break
        case .Reply:
            break
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func BackAction(_ sender: Any) {
          self.navigationController?.popViewController(animated: true)
    }
    
}

