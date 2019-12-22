//
//  Loadable.swift
//  LearningMVVM
//
//  Created by Niraj on 20/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit

protocol Loadable {
    func showLoadingView()
    func hideLoadingView()
}

extension Loadable where Self: UIViewController {

    func showLoadingView() {
        if let nibViews = Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil) {

            if let loadingView = nibViews.first as? LoadingView {

                loadingView.translatesAutoresizingMaskIntoConstraints = false

                let topConstraint = loadingView.topAnchor.constraint(equalTo: view.topAnchor)
                let bottomConstraint = loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                let trailingConstraint = loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                let leadingConstraint = loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor)

                view.addSubview(loadingView)
                view.addConstraints([topConstraint, bottomConstraint, trailingConstraint, leadingConstraint])
            }
        }
    }

    func hideLoadingView() {
        view.getSubviews(type: LoadingView.self)
            .forEach { $0.removeFromSuperview() }
    }
}
