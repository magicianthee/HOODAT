//
//  FeedCell.swift
//  VandyHack
//
//  Created by Dagmawi Assefa on 11/12/16.
//  Copyright © 2016 phase2Labs. All rights reserved.
//

import UIKit

class MessageCell: UICollectionViewCell {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var message: Message?{
        didSet{
            username.text = message?.friend?.name
            
            if let profileImageName = message?.friend?.profileImageName{
                
                profileImageView.image = UIImage(named: profileImageName)
            }
            mutualFriendsNotification.text = message?.friend?.mutualFriend
        }
    }
    let profileImageView: UIImageView = {
        
        let profileImage = UIImageView()
        profileImage.contentMode = .scaleAspectFit
        profileImage.backgroundColor = UIColor.red
        profileImage.layer.cornerRadius = 30
        profileImage.layer.masksToBounds = true
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        return profileImage
    }()
    
    let username: UILabel = {
        let username = UILabel()
        username.text = "Dagmawi Assefa"
        username.font = UIFont.boldSystemFont(ofSize: 15)
        //username.backgroundColor = UIColor.red
        username.textColor = UIColor.black
        
        return username
    }()
    
    let mutualFriendsNotification: UILabel = {
        let notification = UILabel()
        notification.text = "2 Mutual Friends"
        //notification.backgroundColor = UIColor.yellow
        notification.font = UIFont.systemFont(ofSize: 12)
        notification.textColor = UIColor.gray
        
        return notification
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 26)
    
        button.setTitleColor(UIColor.black, for: .normal)
        
        return button
    }()
    
    func setupViews(){
        
        let containerView = UIView()
    
        addSubview(profileImageView)
        addSubview(containerView)
        
        //Vertical Constraint
        addConstraintWithFormat(format: "V:|-7-[v0(60)]", views: profileImageView)
        addConstraintWithFormat(format:"V:|[v0]|", views: containerView)
        
        //Horizontal Constraint
        addConstraintWithFormat(format: "H:|-7-[v0(60)]-7-[v1]|", views: profileImageView, containerView)
        
        //Add container subviews
        containerView.addSubview(username)
        containerView.addSubview(mutualFriendsNotification)
        containerView.addSubview(addButton)
        
        //Add Container Vertical Constraint
        containerView.addConstraintWithFormat(format:"V:|-25-[v0(20)]-3-[v1(12)]", views: username, mutualFriendsNotification)
        containerView.addConstraintWithFormat(format:"V:|-25-[v0(26)]", views: addButton)
        
        //Add Container Horizontal Constraint
        
        containerView.addConstraintWithFormat(format:"H:|-3-[v0]", views: username)
        containerView.addConstraintWithFormat(format:"H:|-3-[v0]", views: mutualFriendsNotification)
        containerView.addConstraintWithFormat(format:"H:[v0(26)]-7-|", views: addButton)
        
        
    }
}

extension UIView{
    
    func addConstraintWithFormat(format: String, views: UIView...){
        
        var viewsDictionary = [String: UIView]()
        for(index, view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

