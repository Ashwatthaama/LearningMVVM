//
//  Contact.swift
//  LearningMVVM
//
//  Created by Niraj on 20/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import Foundation

struct Contact: Codable {

    let name: String
    let photoUrl: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case name
        case photoUrl
        case description
    }

    init(_ name: String, photoUrl: String, description: String) {
        self.name = name
        self.photoUrl = photoUrl
        self.description = description
    }
}
