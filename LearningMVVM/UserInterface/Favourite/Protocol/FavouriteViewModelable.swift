//
//  FavouriteViewModalable.swift
//  LearningMVVM
//
//  Created by Niraj on 21/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit
import RxCocoa

protocol FavouriteViewModelable {
    init(view: FavouriteViewable?)
    var isButtonVisible: BehaviorRelay<Bool> { get set }
    var isFavorited: BehaviorRelay<Bool> { get set }
    func tapFavorite()
}
