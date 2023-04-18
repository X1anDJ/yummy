//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by Dajun Xian on 4/13/23.
//

import UIKit

class DishDetailViewController: UIViewController {

    //steps for creating new page
    //1. design the layout at main.storyboard
    //2. create this class, set class and storyboard id as DishDetailViewController
    //3. connect all components (Images, titles, labels) to this class
    // for this dish detail view controller, we need to create the ui view controller extension to help with returning 'identifier' and 'instantiat'. 'instantiat' can help the home view to apply 'didSelectItemAt' method
    //4. create populateView() for updating IBs
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateView()
        // Do any additional setup after loading the view.
    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }
    
    @IBAction func placeOrderButtonClicked(_ sender: UIButton) {
    }
    
}
