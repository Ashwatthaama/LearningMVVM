//
//  UIViewController.swift
//  LearningMVVM
//
//  Created by Niraj on 20/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit

extension UIViewController {
    func addChild(_ child: AnyObject?) {
        if let child = child as? UIViewController {
            addChild(child)
            child.didMove(toParent: self)
        }
    }
}
