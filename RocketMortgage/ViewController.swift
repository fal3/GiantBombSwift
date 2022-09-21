//
//  ViewController.swift
//  RocketMortgage
//
//  Created by Alexander Fallah on 9/21/22.
//

import UIKit

final class ViewController: UICollectionViewController {

    var models: [CellModel] {
        didSet {
            collectionView.reloadData()
        }
    }

    init() {
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
        models = []
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
        
        fetchSlides {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
//                self.models = slides.compactMap({ CellModel(title: $0.metaData?.items?.caption, imageURL: URL(string: $0.metaData?.crops?.oneToOne ?? "")) })
            }
        }
    
    }
    
    
    func fetchSlides(completion: @escaping  (VideoGamesDataModel) -> ()) {
        guard let url = URL(string: "https://www.giantbomb.com/api/documentation/#toc-0-5 ") else { return }
        let request = URLRequest(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: request){ (data, _, error) in
            do {
                guard let data = data else { return }
                let decoder = JSONDecoder()
                let gamesData = try decoder.decode(VideoGamesDataModel.self, from: data)
//                let decoded = try decoder.decode(VideoGamesDataModel.self, from: data)
                
                completion(gamesData)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
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
}


