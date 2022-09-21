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
    
    var games: [Game]   {
        didSet {
            func cellModel(_ game: Game) -> CellModel? {
                let name = game.name
                let imageURL = URL(string: game.image?.thumbUrl ?? "")
                return CellModel(title: name, imageURL: imageURL)
            }
            self.models = games.compactMap(cellModel) ?? []
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
        games = []
        models = []
        super.init(collectionViewLayout: generateLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var searchController: UISearchController = {
        let resultsViewController = ResultsViewController([])
        resultsViewController.collectionView.delegate = self
       var searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.delegate = self // Monitor when the search button is tapped.
        
        return searchController
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        self.title = "Video games"
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "Cell")
        
        GamesAPI.fetchGames { games in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                let games = games.results?.compactMap({$0}) ?? []
                self.filteredGames = games
                self.games = games
            }
        }
        
        self.navigationItem.searchController = searchController
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
        let game = filteredGames[indexPath.item]
        let detailViewController = DetailViewController(game: game)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    var filteredGames = [Game]()
}



// MARK: - UISearchBarDelegate

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        self.filteredGames = self.games.filter({($0.name?.lowercased() ?? "").contains(text.lowercased())})
        self.models = filteredGames.compactMap(cellModel)
    
        searchBar.resignFirstResponder()
        
    }
    func cellModel(_ game: Game) -> CellModel? {
        let name = game.name
        let imageURL = URL(string: game.image?.thumbUrl ?? "")
        return CellModel(title: name, imageURL: imageURL)
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        self.filteredGames = games
    }
    
}

// MARK: - UISearchControllerDelegate

// Use these delegate functions for additional control over the search controller.

extension ViewController: UISearchControllerDelegate {
    
    func presentSearchController(_ searchController: UISearchController) {
        //Swift.debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
    func willPresentSearchController(_ searchController: UISearchController) {
        //Swift.debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        //Swift.debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        //Swift.debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        //Swift.debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
}
