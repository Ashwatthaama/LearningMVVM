//
//  ContactViewable.swift
//  LearningMVVM
//
//  Created by Niraj on 21/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit

protocol ContactViewable: AnyObject, Loadable {
    var viewModel: ContactViewModelable? { get set }
    var favouriteView: FavouriteViewable? { get set }
    var photoImageView: UIImageView? { get set }
    var nameLabel: UILabel? { get set }
    var descriptionLabel: UILabel? { get set }
}
