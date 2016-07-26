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
        tv.backgroundColor = UIColor.clearColor()
        tv.textColor = .whiteColor()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let bubbleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 0, g:137,b: 249)
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var bubbleWidthAnchor: NSLayoutConstraint?
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        //backgroundColor = UIColor.redColor()
        
        addSubview(bubbleView)
        addSubview(textView)
        
        //ios 9 constrains
        
        bubbleView.rightAnchor.constraintEqualToAnchor(self.rightAnchor,constant: -8).active = true
        bubbleView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        
        bubbleWidthAnchor = bubbleView.widthAnchor.constraintEqualToConstant(200)
        bubbleWidthAnchor?.active = true
        
        bubbleView.heightAnchor.constraintEqualToAnchor(self.heightAnchor).active = true
        //x,y,z,w,h
        
//        textView.rightAnchor.constraintEqualToAnchor(self.rightAnchor).active = true
        textView.leftAnchor.constraintEqualToAnchor(bubbleView.leftAnchor, constant: 8).active = true
        
        
        textView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        
        textView.rightAnchor.constraintEqualToAnchor(bubbleView.rightAnchor).active = true
//        textView.widthAnchor.constraintEqualToConstant(200).active = true
        
        
        textView.heightAnchor.constraintEqualToAnchor(self.heightAnchor).active = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
