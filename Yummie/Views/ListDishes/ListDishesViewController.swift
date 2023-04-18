//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by Dajun Xian on 4/13/23.
//

import UIKit

class ListDishesViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    
    var dishes: [Dish] = [
        .init(id: "id1", name: "Gari", description: "Taste like shit", image: "https://picsum.photos/100/200", calories: 32),
        .init(id: "id1", name: "Wakaka", description: "Taste like shit", image: "https://picsum.photos/100/200", calories: 132),
        .init(id: "id1", name: "Bed", description: "Taste like shit", image: "https://picsum.photos/100/200", calories: 33),
        .init(id: "id1", name: "Dido", description: "Taste like shit", image: "https://picsum.photos/100/200", calories: 13)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        registerCells()
        // Do any additional setup after loading the view.
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }

}


extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableViwe: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
