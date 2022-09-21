//
//  GamesAPI.swift
//  RocketMortgage
//
//  Created by Alexander Fallah on 9/21/22.
//

import Foundation

enum GameAPIURLConstructor {
    static let fetchGameAPI =  "https://www.giantbomb.com/api/games/?api_key=\(Constants.apiKey)&format=json"
}
class GamesAPI {
    static func fetchGames(completion: @escaping  (VideoGamesDataModel) -> ()) {
        let stringURL = GameAPIURLConstructor.fetchGameAPI
        guard let url = URL(string: stringURL) else { return }
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
}
