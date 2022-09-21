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
    
    var games: [Game] = []

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
        
        fetchSlides { games in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.models = games.results?.compactMap(cellModel) ?? []
                self.games = games.results?.compactMap({$0}) ?? []
            }
        }
        
        func cellModel(_ game: Game) -> CellModel? {
            let name = game.name
            let imageURL = URL(string: game.image?.thumbUrl ?? "")
            return CellModel(title: name, imageURL: imageURL)
        }
    
    }
    
    
    func fetchSlides(completion: @escaping  (VideoGamesDataModel) -> ()) {
        guard let url = URL(string: "https://www.giantbomb.com/api/games/?api_key=\(Constants.apiKey)&format=json") else { return }
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request){ (data, _, error) in
            do {
                guard let data = data else { return }
                let decoder = JSONDecoder()
                let gamesData = try decoder.decode(VideoGamesDataModel.self, from: data)
                completion(gamesData)
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let game = games[indexPath.item]
        let detailViewController = DetailViewController(game: game)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}


