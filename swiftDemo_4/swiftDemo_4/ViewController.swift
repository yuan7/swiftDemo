//
//  ViewController.swift
//  swiftDemo_4
//
//  Created by RY on 16/3/1.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
let identifier = "item"
    var collectionView:UICollectionView?
    let data = PhotoModel.getData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        
    }
    
    /**
     创建Collectionview
     */
    func setupCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: RYLayout())
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.registerClass(RYCell.classForCoder(), forCellWithReuseIdentifier: identifier)
        
        let bgImage = UIImageView(frame: collectionView!.bounds)
        bgImage.image = UIImage(named: "blue")
        collectionView?.backgroundView = bgImage
        view.addSubview(collectionView!)
    }


    
//    MARK:- UICollectionViewDelegate && UICollectionDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as? RYCell
        
        let model = data[indexPath.item]
        item?.imageV?.image = model.featuredImage
        item?.label?.text = model.title
        return item!
    }
}

