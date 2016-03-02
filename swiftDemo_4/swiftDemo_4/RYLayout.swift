//
//  RYLayout.swift
//  swiftDemo_4
//
//  Created by RY on 16/3/1.
//  Copyright © 2016年 ouda. All rights reserved.
//

import UIKit

class RYLayout: UICollectionViewFlowLayout {
    let KSCREEN_WIDTH = UIScreen.mainScreen().bounds.width
    let KSCREEN_HEIGHT = UIScreen.mainScreen().bounds.height
    var collectionW:CGFloat?
    let margin:CGFloat = 10
    var numberOfCollectionView:Int?
    var leftEdge:CGFloat?

    override func prepareLayout() {
        leftEdge = 40
        collectionW = self.collectionView?.bounds.width
        itemSize = CGSize(width: KSCREEN_WIDTH-100, height: 300)
    }
    
    override func collectionViewContentSize() -> CGSize {
        
        //第一组有多少个Item
        numberOfCollectionView = self.collectionView?.numberOfItemsInSection(0)
        return CGSize(width: CGFloat(numberOfCollectionView!)*(KSCREEN_WIDTH-90)+80, height: 0)
    }
    
    
    /**
     返回单个Item的Rect
     
     - parameter indexPath: 原始的Rect
     
     - returns: 返回新的Rect
     */
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attribute = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        attribute.size = CGSize(width: KSCREEN_WIDTH-100, height: 200)
        attribute.center.x = (collectionView?.center.x)!
        
        return attribute
    }
    
    /**
     返回全部的布局
     
     - parameter rect: 原来布局的数组
     
     - returns: 新的布局的数组
     */
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var array = [UICollectionViewLayoutAttributes]()
        
        for i in  0 ..< numberOfCollectionView!{
            let attribute = self.layoutAttributesForItemAtIndexPath(NSIndexPath(forRow: i, inSection: 0))
            attribute?.frame = CGRect(x: leftEdge!+CGFloat(i)*(itemSize.width+margin), y: 0, width: itemSize.width, height: itemSize.height)
            attribute?.center = CGPoint(x: (attribute?.center.x)!, y: (collectionView?.center.y)!)
            array.append(attribute!)
        }
        return array
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return false;
    }
    
    override func targetContentOffsetForProposedContentOffset(var proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let index = Int (((proposedContentOffset.x+itemSize.width/2)+40)/(itemSize.width+margin))
        proposedContentOffset.x = CGFloat(index)*itemSize.width+(itemSize.width-collectionW!)/2+margin*CGFloat(index)+leftEdge!
        return proposedContentOffset
    }
    
}
