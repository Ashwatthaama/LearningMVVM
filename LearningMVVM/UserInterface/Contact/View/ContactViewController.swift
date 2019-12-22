//
//  ViewController.swift
//  LearningMVVM
//
//  Created by Niraj on 20/12/2019.
//  Copyright © 2019 Ashwatthaama. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, ContactViewable, Loadable {


    @IBOutlet weak var stackView: UIStackView?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var photoImageView: UIImageView?
 //   @IBOutlet weak var loadingView: UIView?
  //  @IBOutlet weak var favoriteButton: UIButton?

 ///   lazy var favoriteView = FavoriteViewController()
///    lazy var contactProvider = ContactProvider()

///    var isFavorited = false

    var viewModel: ContactViewModelable?

    var favouriteView: FavouriteViewable? {
        set {
            addChild(newValue)
        }
        get {
            return children.first as? FavouriteViewable
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel?.text = ""
        descriptionLabel?.text = ""
        photoImageView?.image = nil
        stackView?.add(favouriteView)

//      //  addChild(favoriteView)
//        stackView?.add(favoriteView)
//        // Sets an empty UI before the request
//        nameLabel?.text = ""
//        descriptionLabel?.text = ""
//        photoImageView?.image = nil
//        favoriteView.favoriteButton.isHidden = true

        // Shows the loading
      //  loadingView?.isHidden = false


        ///self.showLoadingView()

        // Requests the data from the server
//        getContact { [weak self] contact in
//            guard let contact = contact else {
//                // Hides the loading if there's no contact
//           //     self?.loadingView?.isHidden = true
//                self?.hideLoadingView()
//                return
//            }
//
//            // Downloads the image
//            self?.getImage(url: contact.photoUrl) { image in
//                guard let image = image else {
//                    // Hides the loading if there's no image
//                //    self?.loadingView?.isHidden = true
//                    self?.showLoadingView()
//                    return
//                }
//
//                // Sets all the data in the UI
//                self?.nameLabel?.text = contact.name
//                self?.descriptionLabel?.text = contact.description
//                self?.photoImageView?.image = image
//
//                // Shows the favorite button
//                self?.favoriteView.favoriteButton.isHidden = false
//
//                // Hides the loading when everything finishes
//           //     self?.loadingView?.isHidden = true
//                self?.hideLoadingView()
//            }
//        }


       /// MVVM changes
//        contactProvider.getContact { [weak self ] contact, image in
//
//            defer {
//                self?.hideLoadingView()
//            }
//
//            guard contact != nil, image != nil else {
//                return
//            }
//
//            self?.nameLabel?.text = contact?.name
//            self?.descriptionLabel?.text = contact?.description
//            self?.photoImageView?.image = image
//
//            // Shows the favorite button
//            self?.favoriteView.favoriteButton.isHidden = false
//        }

    }

//    @IBAction func didTapFavoriteButton(_ sender: UIButton) {
//        isFavorited = !isFavorited
//        updateFavoriteButtonStatus()
//    }

//    func updateFavoriteButtonStatus() {
//        let image = isFavorited ? UIImage(named: "love-icon-selected") : UIImage(named: "love-icon-unselected")
//        favoriteButton?.setImage(image, for: .normal)
//    }

//    func getContact(completion: @escaping (Contact?) -> Void) {
//        guard let path = Bundle.main.path(forResource: "Endpoints", ofType: "plist"),
//            let plist = NSDictionary(contentsOfFile: path) else {
//                return
//        }
//        let baseUrl = plist["BaseUrl"] as? String ?? ""
//        guard let url = URL(string: baseUrl+"contact") else {
//            DispatchQueue.main.async {
//                completion(nil)
//            }
//            return
//        }
//        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
//            guard let data = data else {
//                DispatchQueue.main.async {
//                    completion(nil)
//                }
//                return
//            }
//            let result = try? JSONDecoder().decode(Contact.self, from: data)
//            DispatchQueue.main.async {
//                completion(result)
//            }
//        }
//        task.resume()
//    }

//    func getImage(url urlString: String, completion: @escaping (UIImage?) -> Void) {
//        guard let url = URL(string: urlString) else {
//            return
//        }
//        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
//            guard let data = data else {
//                DispatchQueue.main.async {
//                    completion(nil)
//                }
//                return
//            }
//            let image = UIImage(data: data)
//            DispatchQueue.main.async {
//                completion(image)
//            }
//        }
//        task.resume()
//    }

}


class Box<T> {

    typealias Listner = ((T) -> Void)
    var listner: Listner?

    var value: T {
        didSet {
            listner?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(listner: Listner?) {
        self.listner = listner
        listner?(value)
    }
}
