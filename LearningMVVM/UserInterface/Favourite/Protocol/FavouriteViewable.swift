//
//  Favouriteable.swift
//  LearningMVVM
//
//  Created by Niraj on 21/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit

protocol FavouriteViewable: AnyObject {
    var viewModel: FavouriteViewModelable? { get set }
    var favouriteButton: UIButton { get set }
    func updateFavoriteButton(isFavorited: Bool)
}
