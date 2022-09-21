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
        let textView = UILabel(frame: CGRect.zero)
        textView.numberOfLines = 1
        textView.font = UIFont.boldSystemFont(ofSize: 14.0)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.lineBreakMode = .byTruncatingTail
        return textView
    }()
    
    
    lazy var image: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
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
        contentView.addSubview(image)
        contentView.backgroundColor = .white
        NSLayoutConstraint.activate([
            self.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        contentView.backgroundColor = .white
        NSLayoutConstraint.activate([
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        contentView.addSubview(title)
        title.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.8)
        NSLayoutConstraint.activate([
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.topAnchor.constraint(equalTo: image.bottomAnchor),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
