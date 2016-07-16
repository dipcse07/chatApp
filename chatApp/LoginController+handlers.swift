//
//  LoginController+handlers.swift
//  chatApp
//
//  Created by MD.SAZID HASAN DIP on 7/16/16.
//  Copyright © 2016 MD.SAZID HASAN DIP. All rights reserved.
//

import Foundation
import UIKit
import Firebase
extension LoginController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func handleSelectedProfileImageView(){
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        
        presentViewController(picker, animated: true, completion: nil)
        
    }
    
//    
//    func handleRegister() {
//        guard let email = emailTextField.text, password = passwordTextField.text, name = nameTextField.text else {
//            print("Form is not valid")
//            return
//        }
//        
//        FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (user: FIRUser?, error) in
//            
//            if error != nil {
//                print(error)
//                return
//            }
//            
//            guard let uid = user?.uid else {
//                return
//            }
//            
//            //successfully authenticated user
//            
//            let storageRef = FIRStorage.storage().reference().child("")
//            
//            if  let uploadData = UIImagePNGRepresentation( self.profileImageView.image!){
//                
//                 storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
//                    if error != nil {
//                        print(error)
//                        return
//                    }
//                    print(metadata)
//                    
//                 })
//            }
//            
//           
//            
//            let ref = FIRDatabase.database().referenceFromURL("https://gameofchats-762ca.firebaseio.com/")
//            let usersReference = ref.child("users").child(uid)
//            let values = ["name": name, "email": email]
//            usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
//                
//                if err != nil {
//                    print(err)
//                    return
//                }
//                
//                self.dismissViewControllerAnimated(true, completion: nil)
//            })
//            
//        })
//    }
//    
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
      
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"]as? UIImage {
            
            selectedImageFromPicker = editedImage
        }
        
        
        else if let originalImage = info["UIImagePickerControllerOriginalImage"]as? UIImage {
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            profileImageView.image = selectedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("canceled picker")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
}
