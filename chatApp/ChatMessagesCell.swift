//
//  ChatMessagesCell.swift
//  chatApp
//
//  Created by MD.SAZID HASAN DIP on 7/26/16.
//  Copyright © 2016 MD.SAZID HASAN DIP. All rights reserved.
//

import UIKit

class ChatMessagesCell: UICollectionViewCell {
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "Sample text for now"
        tv.font = UIFont.systemFontOfSize(18)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        //backgroundColor = UIColor.redColor()
        
        addSubview(textView)
        
        //ios 9 constrains
        //x,y,z,w,h
        
        textView.rightAnchor.constraintEqualToAnchor(self.rightAnchor).active = true
        textView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        textView.widthAnchor.constraintEqualToConstant(200).active = true
        textView.heightAnchor.constraintEqualToAnchor(self.heightAnchor).active = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
