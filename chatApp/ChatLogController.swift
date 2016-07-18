//
//  ChatLogController.swift
//  chatApp
//
//  Created by MD.SAZID HASAN DIP on 7/18/16.
//  Copyright © 2016 MD.SAZID HASAN DIP. All rights reserved.
//

import UIKit
import Firebase

class ChatLogController: UICollectionViewController,UITextFieldDelegate {
    
    lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter message..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title  = "Chat Log Controller"
        
        collectionView?.backgroundColor = UIColor.whiteColor()
        
        setupInputComponents()
    }
    
    func setupInputComponents() {
        let containerView = UIView()
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        
        //ios9 constraint anchors
        //x,y,w,h
        containerView.leftAnchor.constraintEqualToAnchor(view.leftAnchor).active = true
        containerView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor).active = true
        containerView.widthAnchor.constraintEqualToAnchor(view.widthAnchor).active  = true
        containerView.heightAnchor.constraintEqualToConstant(50).active = true
    
        let sendButton = UIButton(type: .System)
        sendButton.setTitle("Send", forState: .Normal)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.addTarget(self, action: #selector(handleSend), forControlEvents: .TouchUpInside)
        containerView.addSubview(sendButton)
        //x,y,w,h
        sendButton.rightAnchor.constraintEqualToAnchor(containerView.rightAnchor).active = true
        sendButton.centerYAnchor.constraintEqualToAnchor(containerView.centerYAnchor).active = true
        sendButton.widthAnchor.constraintEqualToConstant(80).active  = true
        sendButton.heightAnchor.constraintEqualToAnchor(containerView.heightAnchor).active = true
        
        containerView.addSubview(inputTextField)
        //x,y,w,h
        inputTextField.leftAnchor.constraintEqualToAnchor(containerView.leftAnchor).active = true
        inputTextField.centerYAnchor.constraintEqualToAnchor(containerView.centerYAnchor,constant: 8 ).active = true
        inputTextField.rightAnchor.constraintEqualToAnchor(sendButton.leftAnchor).active  = true
        inputTextField.heightAnchor.constraintEqualToAnchor(containerView.heightAnchor).active = true
        
        let separatorLineView = UIView()
        separatorLineView.backgroundColor = UIColor(r: 220, g: 220,b: 220)
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(separatorLineView)
        //x,y,w,h
        separatorLineView.leftAnchor.constraintEqualToAnchor(containerView.leftAnchor).active = true
        separatorLineView.topAnchor.constraintEqualToAnchor(containerView.topAnchor).active = true
        separatorLineView.widthAnchor.constraintEqualToAnchor(containerView.widthAnchor).active  = true
        separatorLineView.heightAnchor.constraintEqualToConstant(1 ).active = true
        
    }
    
    
    func handleSend(){
        let ref = FIRDatabase.database().reference().child("messages")
        let values = ["text": inputTextField.text!]
        let childRef = ref.childByAutoId()
        
        childRef.updateChildValues(values)
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        handleSend()
        return true
    }
    
}
