//
//  Swinjector.swift
//  LearningMVVM
//
//  Created by Niraj on 21/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//


import Foundation
import Swinject

class Swinjector {
    static var defaultContainer = Container()
    
    static func register() {        
        defaultContainer
            .register(ContactViewable.self) { resolver in
                let storyboard = UIStoryboard(name: "Contact", bundle: nil)
                let viewController = storyboard.instantiateInitialViewController() as? ContactViewController
                viewController?.favouriteView = resolver.resolve(FavouriteViewable.self)
                return viewController ?? ContactViewController()
            }
            .initCompleted { resolver, view in
                view.viewModel = resolver.resolve(ContactViewModelable.self)
            }
        
        defaultContainer
            .register(FavouriteViewable.self) { _ in
                return FavoriteViewController()
            }
            .initCompleted { resolver, view in
                view.viewModel = resolver.resolve(FavouriteViewModelable.self)
            }

        defaultContainer.register(ContactViewModelable.self) { resolver in
            let viewModel = ContactViewModel(view: resolver.resolve(ContactViewable.self))
            viewModel.provider = resolver.resolve(ContactProvidable.self)
            return viewModel
        }

        defaultContainer.register(FavouriteViewModelable.self) { resolver in
            return FavouriteViewModel(view: resolver.resolve(FavouriteViewable.self))
        }

        defaultContainer.register(ContactProvidable.self) { resolver in
            let provider = ContactProvider()
            provider.provider = resolver.resolve(Providable.self)
            return provider
        }

        defaultContainer.register(Providable.self) { resolver in
            return NetworkProvider()
        }
    }
}
