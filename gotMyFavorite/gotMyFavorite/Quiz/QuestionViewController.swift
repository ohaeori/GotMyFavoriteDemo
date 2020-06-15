//
//  ViewController.swift
//  QTest
//
//  Created by ohaeori on 2020/06/15.
//  Copyright © 2020 COMP420. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    var cntO : Int = 5
    var cntCheck = 3
    var cntNum : Int = -1
    var sizeO : Int = 280
    var sizeX : Int = 280
    var quizArr: [String] = []
    var anserArr: [String] = []
    
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var l4: UILabel!
    @IBOutlet weak var l5: UILabel!
    @IBOutlet weak var l6: UILabel!
    @IBOutlet weak var l7: UILabel!
    @IBOutlet weak var l8: UILabel!
    @IBOutlet weak var l9: UILabel!
    @IBOutlet weak var l10: UILabel!
    
    @IBOutlet weak var btnX: UIButton!
    @IBOutlet weak var btnO: UIButton!
    var labelArr : [UILabel] = []
    var receivedID: String = ""
    @IBOutlet weak var Quiz: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelArr.append(l1)
        labelArr.append(l2)
        labelArr.append(l3)
        labelArr.append(l4)
        labelArr.append(l5)
        labelArr.append(l6)
        labelArr.append(l7)
        labelArr.append(l8)
        labelArr.append(l9)
        labelArr.append(l10)
        
                

        
        goNext()
        // Do any additional setup after loading the view.
    }
    
        
    @IBAction func btnCheck(_ sender: UIButton) {
        let arr = SocketIOManager.shared.getMsg()
        print("???")
        print(arr)
        if(cntNum == -1){
            for i in 0..<7{
                quizArr.append(arr[i*2])
                anserArr.append(arr[i*2 + 1])
            }
            cntNum += 1
        }
        
        else{
            if(sender.currentTitle == anserArr[cntNum]){
                cntCheck += 1
                Down()
            }
            else{
                Up()
            }
        }

        
        
    }
    
    func Up() {
        if(sizeO > 60) {
            sizeO -= 60
        }
        if(sizeX < 600){
            sizeX += 60
        }
        btnO.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(sizeO))
        btnX.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(sizeX))
        if(cntO > 0){
            cntO = (cntO - 1)
        }
        labelControl(cnt: cntO, col: #colorLiteral(red: 1, green: 0.3574486375, blue: 0.3093737364, alpha: 1))
        
    }
    func Down() {
        if(sizeX > 60) {
            sizeX -= 60
        }
        if(sizeO < 520){
            sizeO += 60
        }
        btnO.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(sizeO))
        btnX.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(sizeX))
        labelControl(cnt: cntO, col: #colorLiteral(red: 0.8232281208, green: 1, blue: 0.5762448311, alpha: 1))
        if(cntO < 7) {
            cntO = (cntO + 1)
        }
        
    }
    
    func labelControl(cnt: Int, col: UIColor){
        
        labelArr[cnt%8].backgroundColor = col
        if (cnt == 0 && btnO.titleColor(for: .normal)==#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)){
            btnO.setTitleColor(#colorLiteral(red: 0.8232281208, green: 1, blue: 0.5762448311, alpha: 1), for: .normal)
        }
        else {
            btnO.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }
        if (cnt == 7){
            btnX.setTitleColor(#colorLiteral(red: 1, green: 0.3574486375, blue: 0.3093737364, alpha: 1), for: .normal)
        }
        else {
            btnX.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }
        goNext()

    }
    
    func goNext(){
        if(cntNum == -1){
            
        }
        else {
            if(cntNum == 7){
            //            let storyboard: UIStoryboard = UIStoryboard(name: "Quiz", bundle: nil)
            //            let next = storyboard.instantiateViewController(withIdentifier: "Result") as? ResultViewController
            //
            //            next?.score = cntO*10
            //
            //            next?.receivedID = self.receivedID
            //            next?.modalPresentationStyle = .fullScreen
            //            next?.modalTransitionStyle = .coverVertical
            //            self.present(next!, animated: true, completion: nil)
            //            print("here")
                    }
                    else{
                        cntNum += 1
                        print("check8")
                        print(quizArr)
                        let str = "Q" + String(cntNum) + "\n" + quizArr[cntNum-1]
                        Quiz.setTitle(str, for: .normal)
                        
                        
                        print("ee" + String(cntNum))
                    }
                    
                }
        }
        
    
}

