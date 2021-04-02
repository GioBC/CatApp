//
//  DetailViewController.swift
//  Cat Test
//
//  Created by Yermis Giovanny Beltrán Cuervo on 13/03/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var raceNameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var moreCatInfoBtn: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    
    // MARK: Init properties
    let viewModel: CatViewModel
    
    init(viewModel: CatViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: DetailViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        raceNameLabel.text = viewModel.race
        descriptionTextView.text = viewModel.catDescription
        catImage.image = viewModel.image
        
        viewModel.didLoadRating = { [weak self] likeDislike in
            if likeDislike.like {
                self?.likeButton.backgroundColor = .red
                self?.dislikeButton.backgroundColor = .white
            } else if likeDislike.dislike {
                self?.dislikeButton.backgroundColor = .red
                self?.likeButton.backgroundColor = .white
            }
        }
        
        viewModel.getLikeDisLike()
    }
    
    @IBAction func moreInfoButton(_ sender: Any) {
        guard let urlWiki = viewModel.urlWiki ,
              let urlWikipedia = URL(string: urlWiki) else {
            showAlert()
            return
        }
        
        UIApplication.shared.open(urlWikipedia, options: [:], completionHandler: nil)
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Not found",
                                      message: "No more information found",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Back",
                                      style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tapLike(_ sender: Any) {
        viewModel.ratingLike()
        viewModel.getLikeDisLike()
    }
    
    @IBAction func tapDislike(_ sender: Any) {
        viewModel.ratingDislike()
        viewModel.getLikeDisLike()
    }
}
