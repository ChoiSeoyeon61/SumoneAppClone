//
//  AlarmViewController.swift
//  sumoneClone
//
//  Created by 최서연 on 2020/07/08.
//  Copyright © 2020 최서연. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = alarms[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = alarms[indexPath.row]
        let datatoSend: Question
        
        switch selected.type {
        case .Answer:
            break
        case .Question:
//            self.performSegue(withIdentifier: "segue", sender: datatoSend)
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

