//
//  ContactViewModel.swift
//  LearningMVVM
//
//  Created by Niraj on 21/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit
import RxCocoa

class ContactViewModel: ContactViewModelable {

    var view: ContactViewable?
    var provider: ContactProvidable?

    var name =  BehaviorRelay<String?>(value: nil)
    var description = BehaviorRelay<String?>(value: nil)
    var photo =  BehaviorRelay<UIImage?>(value: nil)

    required init(view: ContactViewable?) {
        self.view = view
        Rx.bind(view, selector: #selector(UIViewController.viewDidLoad), handler: load)
        Rx.bind(view, selector: #selector(UIViewController.viewDidLoad), handler: bindOutlets)
    }

    func bindOutlets() {
        Rx.bind(view?.nameLabel, property: name)
        Rx.bind(view?.descriptionLabel, property: description)
        Rx.bind(view?.photoImageView, property: photo)
    }
    
    func load() {

        view?.showLoadingView()

        provider?.getContact { [weak self ] contact, image in

            defer {
                self?.view?.hideLoadingView()
            }

            guard contact != nil, image != nil else {
                return
            }

            self?.name.accept(contact?.name)
            self?.description.accept(contact?.description)
            self?.photo.accept(image)

            self?.view?.favouriteView?.viewModel?.isButtonVisible.accept(true)

        }

    }

}
