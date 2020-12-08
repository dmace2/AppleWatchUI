//
//  CollectionViewLayout.swift
//  Apple Watch UI
//
//  Created by Dylan Mace on 12/8/20.
//
import UIKit

let COLS = 40
let ROWS = 40

class CollectionViewLayout: UICollectionViewLayout {
  let interimSpace: CGFloat = 0.0
  let itemSize: CGFloat = 80
  
  var center: CGPoint {
    return CGPoint(x: (self.cViewSize.width) / 2.0, y: (self.cViewSize.height) / 2.0)
  }
  
  var cellCount: Int {
    return COLS*ROWS
  }
  
  var cViewSize: CGSize {
    return self.collectionView!.frame.size
  }
  
  var a: CGFloat {
    return 2.5 * self.cViewSize.width
  }
  
  var b: CGFloat {
    return 2.5 * self.cViewSize.height
  }
  
  let c: CGFloat = 20
  
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
  
  override var collectionViewContentSize: CGSize {
    get {
      return CGSize(width: self.itemSize * CGFloat(COLS) + self.cViewSize.width,
                    height: self.itemSize * CGFloat(ROWS) + self.cViewSize.height)
    }
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    var attributes = [UICollectionViewLayoutAttributes]()
    
    for i in 0 ..< cellCount {
      let indexPath = IndexPath(row: i, section: 0)
      if let layoutAttributes = layoutAttributesForItem(at: indexPath) {
        attributes.append(layoutAttributes)
      }
    }
    return attributes
  }
  
  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
    
    let oIndex = indexPath.item % COLS // 1
    let vIndex = (indexPath.item - oIndex) / COLS // 2
    
    var x = CGFloat(oIndex) * self.itemSize // 3
    var y = CGFloat(vIndex) * self.itemSize // 4
    
    if vIndex % 2 != 0 { // 5
      x += self.itemSize / 2.0
    }
    
    attributes.center = CGPoint(x: x, y: y) // 6
    
    let offset = self.collectionView!.contentOffset // 7
    x -= (self.center.x + CGFloat(offset.x)) // 8
    y -= (self.center.y + CGFloat(offset.y)) // 9
    
    x = -x*x/(a*a) // 10
    y = -y*y/(b*b) // 11
    var z = c * (x+y) + 1.0 // 12
    z = z < 0.0 ? 0.0 : z // 13
    
    attributes.transform = CGAffineTransform(scaleX: z, y: z) // 14
    attributes.size = CGSize(width: self.itemSize, height: self.itemSize) // 15
    
    return attributes
  }
}
