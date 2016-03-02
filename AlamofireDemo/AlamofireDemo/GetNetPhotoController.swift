//
//  GetNetPhotoController.swift
//  AlamofireDemo
//
//  Created by RY on 16/2/26.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class GetNetPhotoController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var  collectionView:UICollectionView?
    var dataSource:NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = NSMutableArray()
        self.getData()
        self.setupCollectionView()
        
        
    }
    
    func getData(){
        
        Alamofire.request(.GET, "https://api.500px.com/v1/photos", parameters: ["consumer_key": "aFqsylRjz5w4y9b8w9UQY51h7fytcnxfbhXAAeGc"]).responseJSON { (jsonData) -> Void in
            let json = JSON(jsonData.result.value!)
            
            for i in 0 ..< json["photos"].count{
                let id = json["photos"][i]["id"].intValue
                let url = json["photos"][i]["image_url"].string
                self.dataSource?.addObject(PhotoModel(id: id, url: url!))
            }
            
            self.collectionView!.reloadData()
        }
        
        
//        Alamofire.request(.GET, "http://api.map.baidu.com/telematics/v3/weather", parameters: ["location": "济南","ak":"wl82QREF9dNMEEGYu3LAGqdU","output":"json"]).responseJSON { (result) -> Void in
//            let jsonval = JSON(result.result.value!)
//            
//            let jdate = jsonval["results"][0]["weather_data"][1]["date"].string
//            let jweather = jsonval["results"][0]["weather_data"][0]["weather"].string
//            let jtemp = jsonval["results"][0]["weather_data"][0]["temperature"].string
//            let jimage = jsonval["results"][0]["weather_data"][0]["dayPictureUrl"].string
//            let jnightImage = jsonval["results"][0]["weather_data"][0]["nightPictureUrl"].string
//            let jpm25 = jsonval["results"][0]["pm25"].string
//            
//            for i in 0 ..< jsonval["results"][0]["weather_data"].count{
//                let jdate = jsonval["results"][0]["weather_data"][i]["date"].string
//                print(jdate)
//            }
//            
//            }
        
    }
    
    func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView!)
    }

    
    
//    MARK:- UICollectionViewDelegate && UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if dataSource?.count > 0{
            print(dataSource!.count)
            return dataSource!.count
        }else{
            return 0
        }
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.redColor()
        let photoModel = dataSource![indexPath.item] as? PhotoModel
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        cell.contentView.addSubview(imageView)
        Alamofire.request(.GET, photoModel!.url).responseData { (data) -> Void in
            guard let imageData = data.data else {return}
            imageView.image = UIImage(data: imageData)
            
        }
        
        return cell
    }
}
