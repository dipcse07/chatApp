//
//  Message.swift
//  chatApp
//
//  Created by MD.SAZID HASAN DIP on 7/18/16.
//  Copyright © 2016 MD.SAZID HASAN DIP. All rights reserved.
//

import UIKit
import Firebase
class Message: NSObject {
    
    var fromId: String?
    var text: String?
    var timestamp: NSNumber?
    var toId: String?
    
    func chatPartnerId() -> String? {

        return fromId == FIRAuth.auth()?.currentUser?.uid ? toId : fromId
        
    }
    
}

