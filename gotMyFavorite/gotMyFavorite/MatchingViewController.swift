//
//  MatchingViewController.swift
//  gotMyFavorite
//
//  Created by ohaeori on 2020/06/10.
//  Copyright © 2020 COMP420. All rights reserved.
//

import UIKit
import SocketIO

class MatchingViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var MatchingBtn: UIButton!
    
    var receivedID: String = ""
    var labelString: String = "none"
    var socket: SocketIOClient!
    var msgArr: [String] = ["최첨단","역동적인","유머 있는","소름 돋는","학살 하는","경쟁 하는","환상적인","리듬감 있는","사랑스러운","d"]
    
    @IBAction func MatchingStart(_ sender: Any) {
        //change StoryBoard
        let storyboard: UIStoryboard = UIStoryboard(name: "Quiz", bundle: nil)
        let next = storyboard.instantiateViewController(withIdentifier: "Quiz") as? QuestionViewController
        
        next?.quizArr = msgArr
        next?.receivedID = self.receivedID
        next?.modalPresentationStyle = .fullScreen
        next?.modalTransitionStyle = .coverVertical
        self.present(next!, animated: true, completion: nil)
    }
    @IBAction func ModifyFavorite(_ sender: Any) {
        //change StoryBoard
        let storyboard: UIStoryboard = UIStoryboard(name: "getFavorite", bundle: nil)
        let next = storyboard.instantiateViewController(withIdentifier: "CVC") as? ColorViewController
        
        next?.receivedID = self.receivedID
        next?.modalPresentationStyle = .fullScreen
        next?.modalTransitionStyle = .coverVertical
        self.present(next!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SocketIOManager.shared.socketConnect()
//        if (labelString == "none"){
//            MatchingBtn.isEnabled = false
//        }
        titleLabel.text = labelString
        idLabel.text = receivedID
    }
}
