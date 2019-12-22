//
//  ContactViewModalable.swift
//  LearningMVVM
//
//  Created by Niraj on 21/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit
import RxCocoa

protocol ContactViewModelable {
    init(view: ContactViewable?)
    var provider: ContactProvidable? { get set }
    var name: BehaviorRelay<String?> { get set }
    var description: BehaviorRelay<String?> { get set }
    var photo: BehaviorRelay<UIImage?> { get set }
    func load()
}

