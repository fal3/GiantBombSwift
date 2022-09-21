//
//  VideoGameData.swift
//  RocketMortgage
//
//  Created by Alexander Fallah on 9/21/22.
//

import Foundation
import Foundation
public struct Result: Codable {
  struct FirstAppearedInGame: Codable {
    let apiDetailURL: URL
    let id: Int
    let name: String

    private enum CodingKeys: String, CodingKey {
      case apiDetailURL = "api_detail_url"
      case id
      case name
    }
  }
public struct VideoGamesDataModel: Codable {


    struct Image: Codable {
      let iconURL: URL
      let mediumURL: URL
      let screenURL: URL
      let screenLargeURL: URL
      let smallURL: URL
      let superURL: URL
      let thumbURL: URL
      let tinyURL: URL
      let originalURL: URL
      let imageTags: String

      private enum CodingKeys: String, CodingKey {
        case iconURL = "icon_url"
        case mediumURL = "medium_url"
        case screenURL = "screen_url"
        case screenLargeURL = "screen_large_url"
        case smallURL = "small_url"
        case superURL = "super_url"
        case thumbURL = "thumb_url"
        case tinyURL = "tiny_url"
        case originalURL = "original_url"
        case imageTags = "image_tags"
      }
    }

    struct ImageTag: Codable {
      let apiDetailURL: URL
      let name: String
      let total: Int

      private enum CodingKeys: String, CodingKey {
        case apiDetailURL = "api_detail_url"
        case name
        case total
      }
    }

    let aliases: String?
    let apiDetailURL: URL
    let birthday: String?
    let dateAdded: String
    let dateLastUpdated: String
    let deck: String
    let description: String?
    let firstAppearedInGame: FirstAppearedInGame
    let gender: Int
    let guid: String
    let id: Int
    let image: Image
    let imageTags: [ImageTag]
    let lastName: String?
    let name: String
    let realName: String?
    let siteDetailURL: URL

    private enum CodingKeys: String, CodingKey {
      case aliases
      case apiDetailURL = "api_detail_url"
      case birthday
      case dateAdded = "date_added"
      case dateLastUpdated = "date_last_updated"
      case deck
      case description
      case firstAppearedInGame = "first_appeared_in_game"
      case gender
      case guid
      case id
      case image
      case imageTags = "image_tags"
      case lastName = "last_name"
      case name
      case realName = "real_name"
      case siteDetailURL = "site_detail_url"
    }
  }

  let error: String
  let limit: Int
  let offset: Int
  let numberOfPageResults: Int
  let numberOfTotalResults: Int
  let statusCode: Int
  let results: [Result]
  let version: String

  private enum CodingKeys: String, CodingKey {
    case error
    case limit
    case offset
    case numberOfPageResults = "number_of_page_results"
    case numberOfTotalResults = "number_of_total_results"
    case statusCode = "status_code"
    case results
    case version
  }
}
struct Game {
  let format: String
  let fieldList: [String]
  let limit: Int
  let offset: Int
  let platforms: [String]
  let sort: String
  let filter: String
  let fields: [String]
  let dateAdded: Date
  let dateLastUpdated: Date
  let deck: String
  let description: String
  let expectedReleaseDay: Int
  let expectedReleaseMonth: Int
  let expectedReleaseQuarter: Int
  let expectedReleaseYear: Int
  let guid: String
  let id: Int
  let image: String
  let imageTags: [String]
  let name: String
  let numberOfUserReviews: Int
  let originalGameRating: Int
  let originalReleaseDate: Date
  let siteDetailUrl: String
  let resourceType: String
}
