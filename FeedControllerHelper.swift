//
//  FeedControllerHelper.swift
//  VandyHack
//
//  Created by Dagmawi Assefa on 11/12/16.
//  Copyright © 2016 phase2Labs. All rights reserved.
//

import UIKit

extension FeedController {
    
    func setupData() {
        
        let user1 = Friend()
        user1.name = "Dagmawi Assefa"
        user1.profileImageName = "dagm"
        user1.mutualFriend = "3 Mutual Friends"
        
        let message = Message()
        message.friend = user1
        //message.message = "Hey there, how are you?"
        //message.date = NSDate()
        
        let user2 = Friend()
        user2.name = "Harrison Whaley"
        user2.profileImageName = "harry"
        user2.mutualFriend = "5 Mutual Friends"
        
        let message2 = Message()
        message2.friend = user2
       // message2.message = "Hey there, how are you?"
        //message2.date = NSDate()
        
        messageArray = [message, message2]
    }

    
}
