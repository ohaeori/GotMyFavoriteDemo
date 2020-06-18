//
//  SocketIOManager.swift
//  gotMyFavorite
//
//  Created by ohaeori on 2020/06/10.
//  Copyright © 2020 COMP420. All rights reserved.
//

//
//  SocketIOManager.swift
//  gotMyFavorite
//
//  Created by ohaeori on 2020/06/10.
//  Copyright © 2020 COMP420. All rights reserved.
//

import UIKit
import SocketIO

class SocketIOManager: NSObject {
    static let shared = SocketIOManager()
    var DATA = "d"
    var manager = SocketManager(socketURL: URL(string: "http://39.121.50.85:54123")!, config: [.log(true), .compress])
     var socket: SocketIOClient!
     override init() {
         super.init()
         socket = self.manager.socket(forNamespace: "/test")

        socket.on("test") {data, ack in print(data)
            let D = data[0]as!NSDictionary
            self.DATA = D["res"]as!String
            
        }
        
        
    }
    func getMsg()->[String]{
        let arr = DATA.components(separatedBy: ".")
        return arr
    }

     func socketConnect() {
         socket.connect()
     }
     
     func socketDisConnect() {
         socket.disconnect()
     }
    
     func sendMsg(message: String, nickname: String) {
         socket.emit("event2", ["name" : "ns", "email" : message])
     }
}
