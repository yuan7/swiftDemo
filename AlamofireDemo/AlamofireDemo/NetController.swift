//
//  NetController.swift
//  AlamofireDemo
//
//  Created by RY on 16/2/26.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit
import Alamofire



private let reuseIdentifier = "Cell"

var photoInfo:NSMutableArray?

class NetController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        photoInfo = NSMutableArray()
        
        self.getData()

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }


    func getData(){
        
        Alamofire.request(.GET, "https://api.500px.com/v1/photos", parameters: ["consumer_key": "aFqsylRjz5w4y9b8w9UQY51h7fytcnxfbhXAAeGc"]).responseJSON() {
            response in
            guard let JSON = response.result.value else { return }
            guard let photoJsons = JSON.valueForKey("photos") as? [NSDictionary] else {return}

            photoJsons.forEach {
                guard let nsfw = $0["nsfw"] as? Bool,
                    let id = $0["id"] as? Int,
                    let url = $0["image_url"] as? String
                    where nsfw == false else { return }
                    photoInfo?.addObject(PhotoModel(id: id, url: url))
            }
        }
        self.collectionView?.reloadData()
    }
    

    // MARK: UICollectionViewDataSource


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return (photoInfo?.count)!
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.redColor()
    
        return cell
    }
}
