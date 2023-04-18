//
//  String+Extension.swift
//  Yummie
//
//  Created by Dajun Xian on 4/12/23.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
