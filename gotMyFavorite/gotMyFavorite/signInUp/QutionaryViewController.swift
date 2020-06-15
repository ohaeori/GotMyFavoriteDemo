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
    var qlist = [String]()
    var answerlist = [String]()
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func OClick(_ sender: UIButton) {
        self.qlist.append(inputQ.text!)
        self.answerlist.append("o")
        let indexPath = IndexPath(row: self.qlist.count - 1, section: 0)
        self.qlistView.insertRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        inputQ.text = ""
    }
    
    @IBAction func XClick(_ sender: UIButton) {
        self.qlist.append(inputQ.text!)
        self.answerlist.append("x")
        let indexPath = IndexPath(row: self.qlist.count - 1, section: 0)
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
                return qlist.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = qlistView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as! customTableViewCell
        cell.questionLabel.text = String(indexPath.row + 1) + ". " + qlist[indexPath.row]
        if(answerlist[indexPath.row] == "o"){
            cell.XButton.alpha = 0
        } else {
            cell.OButton.alpha = 0
        }
        
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            qlist.remove(at: indexPath.row)
            self.qlistView.insertRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}

extension QutionaryViewController: UITableViewDelegate{
    
}
