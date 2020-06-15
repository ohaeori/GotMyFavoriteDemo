//
//  QutionaryViewController.swift
//  gotMyFavorite
//
//  Created by ohaeori on 2020/06/15.
//  Copyright © 2020 COMP420. All rights reserved.
//

import UIKit

class QutionaryViewController: UIViewController {
    @IBOutlet weak var inputQ: UITextField!
    @IBOutlet weak var qlistView: UITableView!
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func OClick(_ sender: UIButton) {
        User.Users[0].qList.append(inputQ.text!)
        User.Users[0].ansList.append("o")
        let indexPath = IndexPath(row: User.Users[0].qList.count - 1, section: 0)
        self.qlistView.insertRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        inputQ.text = ""
    }
    
    @IBAction func XClick(_ sender: UIButton) {
        User.Users[0].qList.append(inputQ.text!)
        User.Users[0].ansList.append("x")
        let indexPath = IndexPath(row: User.Users[0].qList.count - 1, section: 0)
        self.qlistView.insertRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        inputQ.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qlistView.dataSource = self
        qlistView.delegate = self
    }
}

extension QutionaryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return User.Users[0].qList.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = qlistView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as! customTableViewCell
        cell.questionLabel.text = String(indexPath.row + 1) + ". " + User.Users[0].qList[indexPath.row]
        if(User.Users[0].ansList[indexPath.row] == "o"){
            cell.XButton.alpha = 0
        } else {
            cell.OButton.alpha = 0
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               // Delete the row from the data source
               User.Users[0].qList.remove(at: (indexPath as NSIndexPath).row)
               User.Users[0].ansList.remove(at: (indexPath as NSIndexPath).row)
               tableView.deleteRows(at: [indexPath], with: .fade)
           } else if editingStyle == .insert {
               // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
           }
       }
}

extension QutionaryViewController: UITableViewDelegate{
    
}
