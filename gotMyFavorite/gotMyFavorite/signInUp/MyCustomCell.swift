//
//  MyCustomCell.swift
//  gotMyFavorite
//
//  Created by qkrwoghk on 2020/06/15.
//  Copyright © 2020 COMP420. All rights reserved.
//

import UIKit

class ListViewController: UIViewController  {
    var strings:[String] = []
       @IBOutlet weak var bulletLabel: UILabel!
    
       override func viewDidLoad()
       {
           super.viewDidLoad()
            
           let bullet1 = "This is a small string"
           let bullet2 = "This is more of medium string with a few more words etc."
           let bullet3 = "Well this is certainly a longer string, with many more words than either of the previuos two strings"
            
           strings = [bullet1, bullet2, bullet3]
            
        let attributesDictionary = [NSAttributedString.Key.font : bulletLabel.font]
           let fullAttributedString = NSMutableAttributedString(string: "", attributes: attributesDictionary)
            
           for string: String in strings
           {
               let bulletPoint: String = "\u{2022}"
               let formattedString: String = "\(bulletPoint) \(string)\n"
               let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: formattedString)
                
               let paragraphStyle = createParagraphAttribute()
            attributedString.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle], range: NSMakeRange(0, attributedString.length))
                
            fullAttributedString.append(attributedString)
           }
            
           bulletLabel.attributedText = fullAttributedString
       }
        
       func createParagraphAttribute() ->NSParagraphStyle
       {
           var paragraphStyle: NSMutableParagraphStyle
            paragraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
//        paragraphStyle.tabStops = [NSTextTab(textAlignment: .Left, location: 15, options: NSDictionary() as! [NSTextTab.OptionKey : Any])]
           paragraphStyle.defaultTabInterval = 15
           paragraphStyle.firstLineHeadIndent = 0
           paragraphStyle.headIndent = 15
    
           return paragraphStyle
       }
}
