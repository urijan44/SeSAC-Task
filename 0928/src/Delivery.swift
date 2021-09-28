//
//  ViewController.swift
//  DeliveryPeople
//
//  Created by hoseung Lee on 2021/09/28.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var collectionView: UICollectionView!
  
  let foods = Foods()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let collectionViewCellNibName = UINib(nibName: "\(CollectionViewCell.self)", bundle: nil)
    collectionView.register(collectionViewCellNibName, forCellWithReuseIdentifier: "\(CollectionViewCell.self)")
    
    collectionView.collectionViewLayout = layout()
  }


}

extension ViewController {
  private func layout() -> UICollectionViewLayout{
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = .zero
    layout.minimumInteritemSpacing = 10
    layout.minimumLineSpacing = 20
    
    let width = collectionView.bounds.width / 6
    layout.itemSize = CGSize(width: width, height: width)
    
    return layout
  }
}

extension ViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    foods.catogries.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionViewCell.self)", for: indexPath) as? CollectionViewCell else { fatalError() }
    
    let food = foods.catogries[indexPath.row]
    
    cell.image.image = food.image
    cell.categoryLabel.text = food.name
    
    return cell
  }
}
