//
//  ListOrdersViewController.swift
//  Yummie
//
//  Created by Dajun Xian on 4/18/23.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "id", name: "Dajun", dish: .init(id: "id1", name: "Gari", description: "Taste like shit", image: "https://picsum.photos/100/200", calories: 32)),
        .init(id: "id", name: "Eric", dish: .init(id: "id1", name: "SWww", description: "Taste like shit", image: "https://picsum.photos/100/200", calories: 342)),
        .init(id: "id", name: "Min Max", dish: .init(id: "id1", name: "Qdd", description: "Taste like shit", image: "https://picsum.photos/100/200", calories: 33)),
        .init(id: "id", name: "Kun", dish: .init(id: "id1", name: "Vaa", description: "Taste like shit", image: "https://picsum.photos/100/200", calories: 132))
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCells()
        // Do any additional setup after loading the view.
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension ListOrdersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
