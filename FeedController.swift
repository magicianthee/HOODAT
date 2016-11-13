//
//  ViewController.swift
//  VandyHack
//
//  Created by Dagmawi Assefa on 11/12/16.
//  Copyright © 2016 phase2Labs. All rights reserved.
//

import UIKit
let cellId = "cellId"

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var messageArray: [Message]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Profile"), style: .plain, target: self, action: #selector(showProfile))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "comment"), style: .plain, target: self, action: #selector(showMessage))
        navigationController?.navigationBar.tintColor = UIColor.black
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(MessageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.alwaysBounceVertical = true
        
    }
    
    func showProfile() {
        let profileOfUser = ProfileController()
        present(profileOfUser, animated: true, completion: nil)
        
    }
    
    func showMessage() {
        let recentMessage = RecentMessageController()
        present(recentMessage, animated: true, completion: nil)
        
    }



    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = messageArray?.count {
            return count
        }
        
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MessageCell
        
        if let message = messageArray?[indexPath.item]{
            cell.message = message
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width / 6)
        
    }

}

