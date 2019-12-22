//
//  UIStackView.swift
//  LearningMVVM
//
//  Created by Niraj on 20/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit

extension UIStackView {
    func add(_ view: AnyObject?) {
        if let view = view as? UIViewController {
            addArrangedSubview(view.view)
        }
    }
}
