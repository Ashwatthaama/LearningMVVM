//
//  FavoriteViewController.swift
//  LearningMVVM
//
//  Created by Niraj on 20/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController, FavouriteViewable {
  //  var favouriteButton: UIButton?


    var viewModel: FavouriteViewModelable?

  //  var favoriteButton: UIButton?

    lazy var favouriteButton = UIButton(type: .system)
    
    var isFavorited = false
    
    override func viewDidLoad() {
        // Adding subview
        view.addSubview(favouriteButton)
        
        // Setting up constraints
        setupFavoriteButtonConstraints()
        setupViewContraints()
        
        favouriteButton.accessibilityIdentifier = "favoriteButton"
        
        favouriteButton.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        
        // Setting up button initial state
        favouriteButton.isHidden = true
        updateFavoriteButton(isFavorited: false)
    }
    
    @objc func didTapFavoriteButton() {
        isFavorited = !isFavorited
        updateFavoriteButton(isFavorited: isFavorited)
    }
    
    func updateFavoriteButton(isFavorited: Bool) {
        let image = isFavorited ? UIImage(named: "love-icon-selected") : UIImage(named: "love-icon-unselected")
        favouriteButton.setImage(image, for: .normal)
    }
    
    private func setupFavoriteButtonConstraints() {
        favouriteButton.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = favouriteButton.heightAnchor.constraint(equalToConstant: 20)
        let widthConstraint = favouriteButton.widthAnchor.constraint(equalToConstant: 20)
        let centerXConstraint = favouriteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let centerYConstraint = favouriteButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        view.addConstraints([heightConstraint, widthConstraint, centerXConstraint, centerYConstraint])
    }
    
    private func setupViewContraints() {
        let viewWidthConstraint = view.widthAnchor.constraint(equalToConstant: 20)
        let viewHeightConstraint = view.heightAnchor.constraint(equalToConstant: 20)
        
        view.addConstraints([viewWidthConstraint, viewHeightConstraint])
    }
}
