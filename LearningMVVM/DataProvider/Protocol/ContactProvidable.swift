//
//  ContactProvidable.swift
//  LearningMVVM
//
//  Created by Niraj on 21/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit

protocol ContactProvidable {
    var provider: Providable? { get set }
    func getContact(completion: @escaping (Contact?, UIImage?) -> Void)
}
