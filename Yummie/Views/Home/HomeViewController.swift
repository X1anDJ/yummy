//
//  HomeViewController.swift
//  Yummie
//
//  Created by Dajun Xian on 4/12/23.
//

import UIKit

class HomeViewController: UIViewController {

    // connect delegate
    // 1.create IBOutlet with assistant
    // 2.use right pannel to select connection inspector, drag outlet's delegate and dataSource to the storyboard view's "Yummy pause button" (this is connecting it to self)
    //This is the same as
    //  categoryCollectionView.delegate = self
    //  categoryCollectionView.dataSource = self
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialCollectionView: UICollectionView!
    
    
    
    var categories: [DishCategory] = [
        //fetch from backend
        .init(id: "id1", name: "Chinese Dish 1", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Chinese Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Chinese Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Chinese Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Chinese Dish 5", image: "https://picsum.photos/100/200")
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Gari", description: "Taste like shit", image: "https://picsum.photos/100/200", calories: 32),
        .init(id: "id1", name: "Wakaka", description: "Taste like shit", image: "https://picsum.photos/100/200", calories: 132),
        .init(id: "id1", name: "Bed", description: "Taste like shit", image: "https://picsum.photos/100/200", calories: 33),
        .init(id: "id1", name: "Dido", description: "Taste like shit", image: "https://picsum.photos/100/200", calories: 13)
    ]
    
    var specials: [Dish] = [
        .init(id: "id1", name: "Gari", description: "Taste like shit", image: "https://picsum.photos/100/200", calories: 32),
        .init(id: "id1", name: "Wakaka", description: "Taste like shit", image: "https://picsum.photos/100/200", calories: 132),
        .init(id: "id1", name: "Bed", description: "Taste like shit", image: "https://picsum.photos/100/200", calories: 33),
        .init(id: "id1", name: "Dido", description: "Taste like shit", image: "https://picsum.photos/100/200", calories: 13)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        specialCollectionView.dataSource = self
        specialCollectionView.delegate = self
        registerCells()
    }
    
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        
        specialCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
        
    }


}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    //number of items in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialCollectionView:
            return specials.count
        default: return 0
        }
        
    }
    
    //cell for item at
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case specialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    //did select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
}
