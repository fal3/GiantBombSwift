//
//  ResultsViewController.swift
//  RocketMortgage
//
//  Created by Alexander Fallah on 9/21/22.
//

import Foundation
import UIKit
final class ResultsViewController: UICollectionViewController {

    var models: [CellModel] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var games: [Game] = []

    init(_ games: [Game]) {
        func generateLayout() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                let isWide = layoutEnvironment.container.effectiveContentSize.width > 500
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
                let groupHeight = NSCollectionLayoutDimension.fractionalWidth(isWide ? 0.25 : 0.5)
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: groupHeight)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: isWide ? 4 : 2)
                let section = NSCollectionLayoutSection(group: group)
                return section
            }
            return layout
        }
        func cellModel(_ game: Game) -> CellModel? {
            let name = game.name
            let imageURL = URL(string: game.image?.thumbUrl ?? "")
            return CellModel(title: name, imageURL: imageURL)
        }
        self.models = games.compactMap(cellModel) 
        self.games = games
        
        super.init(collectionViewLayout: generateLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        self.title = "Video games"
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "Cell")
            

    }

    ///- Mark: - Data source
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? Cell else { fatalError() }
        let model = models[indexPath.item]
        cell.setUpCell(model: model)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let game = games[indexPath.item]
        let detailViewController = DetailViewController(game: game)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
