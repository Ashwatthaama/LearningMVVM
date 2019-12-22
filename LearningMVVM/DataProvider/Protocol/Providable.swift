//
//  Providable.swift
//  LearningMVVM
//
//  Created by Niraj on 21/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit

protocol Providable {
    func get<T: Codable>(_ type: T.Type, completion: @escaping (T?) -> Void)
    func getImage(_ identifier: String, completion:@escaping (UIImage?) -> Void)
}
