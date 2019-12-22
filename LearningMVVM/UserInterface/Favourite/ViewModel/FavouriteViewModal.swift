//
//  FavouriteViewModal.swift
//  LearningMVVM
//
//  Created by Niraj on 21/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import Foundation
import RxCocoa

class FavouriteViewModel: FavouriteViewModelable {
    weak var view: FavouriteViewable?

    var isButtonVisible = BehaviorRelay<Bool>(value: false)
    var isFavorited = BehaviorRelay<Bool>(value: false)

    required init(view: FavouriteViewable?) {
        self.view = view
        Rx.bind(view?.favouriteButton, handler: tapFavorite)
        Rx.bind(isFavorited, handler: updateState)
        Rx.bind(isButtonVisible, handler: updateVisibility)
    }

    func tapFavorite() {
        isFavorited.accept(!isFavorited.value)
    }

    func updateState(_ value: Bool) {
        view?.updateFavoriteButton(isFavorited: value)
    }

    func updateVisibility(_ value: Bool) {
        view?.favouriteButton.isHidden = !value
    }
}
