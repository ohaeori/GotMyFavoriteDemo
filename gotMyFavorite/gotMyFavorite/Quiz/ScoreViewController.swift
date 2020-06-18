//
//  ScoreViewController.swift
//  gotMyFavorite
//
//  Created by ohaeori on 2020/06/15.
//  Copyright © 2020 COMP420. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    var score : Int = 0
    var receivedID: String = ""
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "your partner have " + String(score) + "points\n" + "do you want connect your partner?\n"+"then, put your number or email"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func Yes(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                      let next = storyboard.instantiateViewController(withIdentifier: "MatchingViewController") as? MatchingViewController
                      
          
        
                      next?.modalPresentationStyle = .fullScreen
                      next?.modalTransitionStyle = .coverVertical
                      self.present(next!, animated: true, completion: nil)
    }
    @IBAction func No(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let next = storyboard.instantiateViewController(withIdentifier: "MatchingViewController") as? MatchingViewController
                    
        
      
                    next?.modalPresentationStyle = .fullScreen
                    next?.modalTransitionStyle = .coverVertical
                    self.present(next!, animated: true, completion: nil)
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
