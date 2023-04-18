//
//  DishPortraitCollectionViewCell.swift
//  Yummie
//
//  Created by Dajun Xian on 4/12/23.
//

import UIKit

class DishPortraitCollectionViewCell: UICollectionViewCell {

    static let identifier = "DishPortraitCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImageLabel: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(dish: Dish) {
        titleLabel.text = dish.name
        dishImageLabel.kf.setImage(with: dish.image?.asUrl)
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
    }
    //after creating the setup, we need to connect it by
    // 1. setup identifier (static let identifier = )
    // 2. check if the DishPortraitCollectionViewCell of storyboard's class and identifier on the attribute inspecter
    
}
