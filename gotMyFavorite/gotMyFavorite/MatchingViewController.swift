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
    @IBOutlet weak var titleLabel1: UILabel!
    @IBOutlet weak var titleLabel2: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var MatchingBtn: UIButton!
    
    var receivedID: String = ""
    var labelString: String = "none"
    var socket: SocketIOClient!
    
    @IBAction func MatchingStart(_ sender: Any) {
        
        makeArr()
        //change StoryBoard
        let storyboard: UIStoryboard = UIStoryboard(name: "Quiz", bundle: nil)
        let next = storyboard.instantiateViewController(withIdentifier: "Quiz") as? QuestionViewController
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
      
        titleLabel1.sizeToFit()
        titleLabel1.text = User.Users[0].mainTitle
        
        titleLabel2.sizeToFit()
        titleLabel2.text = User.Users[0].subTitle
        
        idLabel.text = User.Users[0].id
        genderLabel.text = User.Users[0].gender=="남" ? "🚹" : "🚺"
    }
    
    func makeArr(){
        SocketIOManager.shared.socketConnect()
        SocketIOManager.shared.sendMsg(message: labelString, nickname: receivedID)    }
}
