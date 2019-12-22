//
//  ContactProvider.swift
//  LearningMVVM
//
//  Created by Niraj on 21/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit

class ContactProvider: ContactProvidable {

    var provider: Providable?

    typealias ContactImage = (Contact?, UIImage?) -> Void

    func getContact(completion:@escaping ContactImage) {

        provider?.get(Contact.self) { [weak self] contact in
            guard let contact = contact else {
                completion(nil, nil)
                return
            }
            
            self?.provider?.getImage(contact.photoUrl, completion: { image in
                guard let image = image else {
                    completion(nil, nil)
                    return
                }
                completion(contact, image)
            })
        }
    }
    
}
