//
//  ViewCell+Ext.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 07.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

protocol Reusable {}

extension UITableViewCell: Reusable {}

extension Reusable where Self: UITableViewCell {
    static var reuseID: String {
        return String(describing: self)
    }
}
