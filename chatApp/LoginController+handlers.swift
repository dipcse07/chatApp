//
//  LoginController+handlers.swift
//  chatApp
//
//  Created by MD.SAZID HASAN DIP on 7/16/16.
//  Copyright © 2016 MD.SAZID HASAN DIP. All rights reserved.
//

import Foundation
import UIKit
extension LoginController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func handleSelectedProfileImageView(){
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        
        presentViewController(picker, animated: true, completion: nil)
        
    }
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
