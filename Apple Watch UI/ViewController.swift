//
//  ViewController.swift
//  Apple Watch UI
//
//  Created by Dylan Mace on 12/8/20.
//

import UIKit

let cellCount = ROWS * COLS

class ViewController: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView! {
    didSet {
      collectionView.dataSource = self
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.collectionViewLayout = CollectionViewLayout()
    collectionView.register(ButtonCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
  }
  
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cellCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
    return cell
  }
}
