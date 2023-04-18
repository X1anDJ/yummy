//
//  Dish.swift
//  Yummie
//
//  Created by Dajun Xian on 4/12/23.
//

import Foundation

struct Dish {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) Cals"
    }
}
