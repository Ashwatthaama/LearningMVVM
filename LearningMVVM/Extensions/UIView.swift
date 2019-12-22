//
//  UIView.swift
//  LearningMVVM
//
//  Created by Niraj on 20/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit

extension UIView {
    func getSubviews<T: UIView>(type: T.Type) -> [T] {
        var result: [T] = []
        for subview in subviews {
            result += subview.getSubviews(type: type) as [T]
            if let subview = subview as? T {
                result.append(subview)
            }
        }
        return result
    }
}
