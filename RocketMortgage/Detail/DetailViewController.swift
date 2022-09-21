//
//  DetailViewController.swift
//  RocketMortgage
//
//  Created by Alexander Fallah on 9/21/22.
//

import UIKit

class DetailViewController: UIViewController {
    let game: Game
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    
    init(game: Game) {
        self.game = game
        super.init(nibName: nil, bundle: nil)
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        descriptionLabel.text = "\(game.deck ?? "")"
        self.title = game.name
        
        guard let imageURL = URL(string: game.image?.iconUrl ?? "") else { return }
        
        URLSession.shared.dataTask(with: imageURL, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.gameImage.image = UIImage(data: data)
            }
        }).resume()

    }

}
