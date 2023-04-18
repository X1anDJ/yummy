//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by Dajun Xian on 4/12/23.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    //create identifier for initializing the category cell of homeview ()
    // i,e:
    /*
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: <#T##String#>, for: <#T##IndexPath#>) as! CategoryCollectionViewCell
         return cell
     }
     */
    //then go to storyboard of the CategoryCollectionViewCell and set identifier as "CategoryCollectionViewCell"
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    //setup the category view cell's title and label
    func setup(category: DishCategory) {
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }
}
