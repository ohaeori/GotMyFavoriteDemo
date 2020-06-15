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
    
    @IBAction func MatchingStart(_ sender: Any) {
        
        makeArr()
        //socket connect
        //send my for(1~10)
        //receieved 10
        //mk arr
        
        
        //change StoryBoard
        let storyboard: UIStoryboard = UIStoryboard(name: "Quiz", bundle: nil)
        let next = storyboard.instantiateViewController(withIdentifier: "Quiz") as? QuestionViewController
        next?.quizArr = ["최첨단","역동적인","유머 있는","소름 돋는","학살 하는","경쟁 하는","환상적인","리듬감 있는","사랑스러운","dd"]
        next?.modalPresentationStyle = .fullScreen
        next?.modalTransitionStyle = .coverVertical
        self.present(next!, animated: true, completion: nil)
    }
    @IBAction func ModifyFavorite(_ sender: Any) {
        //change StoryBoard
        let storyboard: UIStoryboard = UIStoryboard(name: "getFavorite", bundle: nil)
        let next = storyboard.instantiateInitialViewController()
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
    
    func makeArr(){
        SocketIOManager.shared.socketConnect()
        SocketIOManager.shared.sendMsg(message: "장난감", nickname: "www")
    }
}
