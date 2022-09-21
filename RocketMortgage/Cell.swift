//
//  Cell.swift
//  RocketMortgage
//
//  Created by Alexander Fallah on 9/21/22.
//

import Foundation
import UIKit

class Cell: UICollectionViewCell {
    // MARK: Variables
    fileprivate lazy var title: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.8)
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    
    lazy var image: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: Init Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    //MARK: Helper Methods
    func setUpCell(model: CellModel) {
        contentView.layer.cornerRadius = 6
        contentView.layer.masksToBounds = true
        self.title.text = model.title
        
        addConstraintsToView()
        URLSession.shared.dataTask(with: model.imageURL, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.image.image = UIImage(data: data)
            }
        }).resume()
    }
    
    fileprivate func addConstraintsToView() {
        let stackView = UIStackView(arrangedSubviews: [image, title])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        contentView.backgroundColor = .white
    }
}
