//
//  NewMassageController.swift
//  chatApp
//
//  Created by MD.SAZID HASAN DIP on 7/16/16.
//  Copyright © 2016 MD.SAZID HASAN DIP. All rights reserved.
//

import UIKit
import Firebase

class NewMessageController: UITableViewController {

    let cellId = "cellId"
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(handleCancel))
    
        tableView.registerClass( UserCell.self, forCellReuseIdentifier: cellId)
        
        fetchUser()
        
     
    }
    
    func fetchUser(){
        FIRDatabase.database().reference().child("users").observeEventType(.ChildAdded, withBlock: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject]{
                
                let user = User()
                user.setValuesForKeysWithDictionary(dictionary)
                
                self.users.append(user)
                dispatch_async(dispatch_get_main_queue(), { 
                    self.tableView.reloadData()
                })
                
                
               // print(user.name,user.email)
                
            }
            
            //print(snapshot)
            
            }, withCancelBlock: nil)
    }
    
    
    func handleCancel(){
    
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        

        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! UserCell
        
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email

        
        if let profileImageUrl = user.profileImageUrl{

            cell.profileImageView.loadImageUsingCacheWithUrlString(profileImageUrl)
            
        }
        return cell
        
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 72
    }

}



class UserCell: UITableViewCell{
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel?.frame = CGRectMake(64, textLabel!.frame.origin.y-2, textLabel!.frame.width, textLabel!.frame.height)
        detailTextLabel?.frame = CGRectMake(64,detailTextLabel!.frame.origin.y+2, detailTextLabel!.frame.width, detailTextLabel!.frame.height)
        
    }
    
    let profileImageView: UIImageView = {
        
        
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 24
        imageView.layer.masksToBounds = true
        imageView.contentMode = .ScaleAspectFill
        
     return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
       super.init(style: .Subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(profileImageView)
        
        ///ios9constraints anchors
        ///need x,y.width,height anchor
        
        profileImageView.leftAnchor.constraintEqualToAnchor(self.leftAnchor,constant: 8).active = true
        profileImageView.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor).active = true
        profileImageView.widthAnchor.constraintEqualToConstant(48).active = true
        profileImageView.heightAnchor.constraintEqualToConstant(48).active = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
