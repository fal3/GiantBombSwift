//
//  VideoGameData.swift
//  RocketMortgage
//
//  Created by Alexander Fallah on 9/21/22.
//

import Foundation
import Foundation
////
////struct VideoGamesDataModel: Codable {
////    public let statusCode: Int
////    public let results: [Result]
////    public let version: String
////
////    private enum CodingKeys: String, CodingKey {
////        case statusCode = "status_code"
////        case results
////        case version
////    }
////
////    init(from decoder: Decoder) throws {
////        let container = try decoder.container(keyedBy: CodingKeys.self)
////        statusCode = try container.decode(Int.self, forKey: .statusCode)
////        results = try container.decode([Result].self, forKey: .results)
////        version = try container.decode(String.self, forKey: .version)
////    }
////
////    func encode(to encoder: Encoder) throws {
////        var container = encoder.container(keyedBy: CodingKeys.self)
////        try container.encode(statusCode, forKey: .statusCode)
////        try container.encode(results, forKey: .results)
////        try container.encode(version, forKey: .version)
////    }
////}
////
//struct Result: Codable {
//    public let apiDetailURL: URL
//    public let id: Int
//    public let image: Image
//    public let name: String
//    public let siteDetailURL: URL
//
//    private enum CodingKeys: String, CodingKey {
//        case apiDetailURL = "api_detail_url"
//        case id
//        case image
//        case name
//        case siteDetailURL = "site_detail_url"
//    }
////    init(from decoder: Decoder) throws {
////        let container = try decoder.container(keyedBy: CodingKeys.self)
////        apiDetailURL = try container.decode(URL.self, forKey: .apiDetailURL)
////        description = try container.decode(String.self, forKey: .description)
////        id = try container.decode(Int.self, forKey: .id)
////        image = try container.decode(Image.self, forKey: .image)
////        name = try container.decode(String.self, forKey: .name)
////        siteDetailURL = try container.decode(URL.self, forKey: .siteDetailURL)
////    }
////
////    func encode(to encoder: Encoder) throws {
////        var container = encoder.container(keyedBy: CodingKeys.self)
////        try container.encode(apiDetailURL, forKey: .apiDetailURL)
////    }
//
//}
////
////struct FirstAppearedInGame: Codable {
////    public let apiDetailURL: URL
////    public let id: Int
////    public let name: String
////
////    private enum CodingKeys: String, CodingKey {
////        case apiDetailURL = "api_detail_url"
////        case id
////        case name
////    }
////
////    init(from decoder: Decoder) throws {
////        let container = try decoder.container(keyedBy: CodingKeys.self)
////        apiDetailURL = try container.decode(URL.self, forKey: .apiDetailURL)
////        id = try container.decode(Int.self, forKey: .id)
////        name = try container.decode(String.self, forKey: .name)
////    }
////
////    func encode(to encoder: Encoder) throws {
////        var container = encoder.container(keyedBy: CodingKeys.self)
////        try container.encode(apiDetailURL, forKey: .apiDetailURL)
////        try container.encode(id, forKey: .id)
////        try container.encode(name, forKey: .name)
////    }
////}
////
////struct Image: Codable {
////    public let iconURL: URL
////    public let mediumURL: URL
////    public let screenURL: URL
////    public let screenLargeURL: URL
////    public let smallURL: URL
////    public let superURL: URL
////    public let thumbURL: URL
////    public let tinyURL: URL
////    public let originalURL: URL
////    public let imageTags: String
////
////    private enum CodingKeys: String, CodingKey {
////        case iconURL = "icon_url"
////        case mediumURL = "medium_url"
////        case screenURL = "screen_url"
////        case screenLargeURL = "screen_large_url"
////        case smallURL = "small_url"
////        case superURL = "super_url"
////        case thumbURL = "thumb_url"
////        case tinyURL = "tiny_url"
////        case originalURL = "original_url"
////        case imageTags = "image_tags"
////    }
////
////    init(from decoder: Decoder) throws {
////        let container = try decoder.container(keyedBy: CodingKeys.self)
////        iconURL = try container.decode(URL.self, forKey: .iconURL)
////        mediumURL = try container.decode(URL.self, forKey: .mediumURL)
////        screenURL = try container.decode(URL.self, forKey: .screenURL)
////        screenLargeURL = try container.decode(URL.self, forKey: .screenLargeURL)
////        smallURL = try container.decode(URL.self, forKey: .smallURL)
////        superURL = try container.decode(URL.self, forKey: .superURL)
////        thumbURL = try container.decode(URL.self, forKey: .thumbURL)
////        tinyURL = try container.decode(URL.self, forKey: .tinyURL)
////        originalURL = try container.decode(URL.self, forKey: .originalURL)
////        imageTags = try container.decode(String.self, forKey: .imageTags)
////    }
////
////    func encode(to encoder: Encoder) throws {
////        var container = encoder.container(keyedBy: CodingKeys.self)
////        try container.encode(iconURL, forKey: .iconURL)
////        try container.encode(mediumURL, forKey: .mediumURL)
////        try container.encode(screenURL, forKey: .screenURL)
////        try container.encode(screenLargeURL, forKey: .screenLargeURL)
////        try container.encode(smallURL, forKey: .smallURL)
////        try container.encode(superURL, forKey: .superURL)
////        try container.encode(thumbURL, forKey: .thumbURL)
////        try container.encode(tinyURL, forKey: .tinyURL)
////        try container.encode(originalURL, forKey: .originalURL)
////        try container.encode(imageTags, forKey: .imageTags)
////    }
////}
//
//import Foundation
//
//struct VideoGamesDataModel: Codable {
//  public let error: String
//  public let limit: Int
//  public let offset: Int
//  public let statusCode: Int
//  public let results: [Result]
//  public let version: String
//
//  private enum CodingKeys: String, CodingKey {
//    case error
//    case limit
//    case offset
//    case numberOfPageResults = "number_of_page_results"
//    case numberOfTotalResults = "number_of_total_results"
//    case statusCode = "status_code"
//    case results
//    case version
//  }
//
//  init(
//    error: String,
//    limit: Int,
//    offset: Int,
//    numberOfPageResults: Int,
//    numberOfTotalResults: Int,
//    statusCode: Int,
//    results: [Result],
//    version: String
//  ) {
//    self.error = error
//    self.limit = limit
//    self.offset = offset
//    self.numberOfPageResults = numberOfPageResults
//    self.numberOfTotalResults = numberOfTotalResults
//    self.statusCode = statusCode
//    self.results = results
//    self.version = version
//  }
//}
//
//
//struct Image: Codable {
//  public let iconURL: URL
//  public let mediumURL: URL
//  public let screenURL: URL
//  public let screenLargeURL: URL
//  public let smallURL: URL
//  public let superURL: URL
//  public let thumbURL: URL
//  public let tinyURL: URL
//  public let originalURL: URL
//  public let imageTags: String
//
//  private enum CodingKeys: String, CodingKey {
//    case iconURL = "icon_url"
//    case mediumURL = "medium_url"
//    case screenURL = "screen_url"
//    case screenLargeURL = "screen_large_url"
//    case smallURL = "small_url"
//    case superURL = "super_url"
//    case thumbURL = "thumb_url"
//    case tinyURL = "tiny_url"
//    case originalURL = "original_url"
//    case imageTags = "image_tags"
//  }
//
//  init(
//    iconURL: URL,
//    mediumURL: URL,
//    screenURL: URL,
//    screenLargeURL: URL,
//    smallURL: URL,
//    superURL: URL,
//    thumbURL: URL,
//    tinyURL: URL,
//    originalURL: URL,
//    imageTags: String
//  ) {
//    self.iconURL = iconURL
//    self.mediumURL = mediumURL
//    self.screenURL = screenURL
//    self.screenLargeURL = screenLargeURL
//    self.smallURL = smallURL
//    self.superURL = superURL
//    self.thumbURL = thumbURL
//    self.tinyURL = tinyURL
//    self.originalURL = originalURL
//    self.imageTags = imageTags
//  }
//}
//
//struct ImageTag: Codable {
//  public let apiDetailURL: URL
//  public let name: String
//  public let total: Int
//
//  private enum CodingKeys: String, CodingKey {
//    case apiDetailURL = "api_detail_url"
//    case name
//    case total
//  }
//
//  init(
//    apiDetailURL: URL,
//    name: String,
//    total: Int
//  ) {
//    self.apiDetailURL = apiDetailURL
//    self.name = name
//    self.total = total
//  }
//}
//
//struct OriginalGameRating: Codable {
//  public let apiDetailURL: URL
//  public let id: Int
//  public let name: String
//
//  private enum CodingKeys: String, CodingKey {
//    case apiDetailURL = "api_detail_url"
//    case id
//    case name
//  }
//
//  init(
//    apiDetailURL: URL,
//    id: Int,
//    name: String
//  ) {
//    self.apiDetailURL = apiDetailURL
//    self.id = id
//    self.name = name
//  }
//}
//
//struct Platform: Codable {
//  public let apiDetailURL: URL
//  public let id: Int
//  public let name: String
//  public let siteDetailURL: URL
//  public let abbreviation: String
//
//  private enum CodingKeys: String, CodingKey {
//    case apiDetailURL = "api_detail_url"
//    case id
//    case name
//    case siteDetailURL = "site_detail_url"
//    case abbreviation
//  }
//
//  init(
//    apiDetailURL: URL,
//    id: Int,
//    name: String,
//    siteDetailURL: URL,
//    abbreviation: String
//  ) {
//    self.apiDetailURL = apiDetailURL
//    self.id = id
//    self.name = name
//    self.siteDetailURL = siteDetailURL
//    self.abbreviation = abbreviation
//  }
//}

import Foundation

class VideoGamesDataModel: Codable {

    var results: [Game]?
    var version: String?
    var offset: Int?
    var statusCode: Int?
    var numberOfPageResults: Int?
    var limit: Int?
    var numberOfTotalResults: Int?
    var error: String?

    enum CodingKeys: String, CodingKey {
        case results = "results"
        case version = "version"
        case offset = "offset"
        case statusCode = "status_code"
        case numberOfPageResults = "number_of_page_results"
        case limit = "limit"
        case numberOfTotalResults = "number_of_total_results"
        case error = "error"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try? container.decode([Game].self, forKey: .results)
        version = try? container.decode(String.self, forKey: .version)
        offset = try? container.decode(Int.self, forKey: .offset)
        statusCode = try? container.decode(Int.self, forKey: .statusCode)
        numberOfPageResults = try? container.decode(Int.self, forKey: .numberOfPageResults)
        limit = try? container.decode(Int.self, forKey: .limit)
        numberOfTotalResults = try? container.decode(Int.self, forKey: .numberOfTotalResults)
        error = try? container.decode(String.self, forKey: .error)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(results, forKey: .results)
        try? container.encode(version, forKey: .version)
        try? container.encode(offset, forKey: .offset)
        try? container.encode(statusCode, forKey: .statusCode)
        try? container.encode(numberOfPageResults, forKey: .numberOfPageResults)
        try? container.encode(limit, forKey: .limit)
        try? container.encode(numberOfTotalResults, forKey: .numberOfTotalResults)
        try? container.encode(error, forKey: .error)
    }
}

class Game: Codable {

    var apiDetailUrl: String?
    var expectedReleaseQuarter: Any?
    var numberOfUserReviews: Int?
    var siteDetailUrl: String?
    var imageTags: [ImageTags]?
    var aliases: String?
    var platforms: [Platforms]?
    var expectedReleaseMonth: Any?
    var originalGameRating: [OriginalGameRating]?
    var name: String?
    var deck: String?
    var description: String?
    var expectedReleaseYear: Int?
    var dateAdded: String?
    var guid: String?
    var dateLastUpdated: String?
    var id: Int?
    var image: Image?

    enum CodingKeys: String, CodingKey {
        case apiDetailUrl = "api_detail_url"
        case expectedReleaseQuarter = "expected_release_quarter"
        case numberOfUserReviews = "number_of_user_reviews"
        case siteDetailUrl = "site_detail_url"
        case imageTags = "image_tags"
        case aliases = "aliases"
        case platforms = "platforms"
        case expectedReleaseMonth = "expected_release_month"
        case originalGameRating = "original_game_rating"
        case name = "name"
        case deck = "deck"
        case description = "description"
        case expectedReleaseYear = "expected_release_year"
        case dateAdded = "date_added"
        case guid = "guid"
        case dateLastUpdated = "date_last_updated"
        case id = "id"
        case originalReleaseDate = "original_release_date"
        case expectedReleaseDay = "expected_release_day"
        case image = "image"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiDetailUrl = try? container.decode(String.self, forKey: .apiDetailUrl)
        numberOfUserReviews = try? container.decode(Int.self, forKey: .numberOfUserReviews)
        siteDetailUrl = try? container.decode(String.self, forKey: .siteDetailUrl)
        imageTags = try? container.decode([ImageTags].self, forKey: .imageTags)
        aliases = try? container.decode(String.self, forKey: .aliases)
        platforms = try? container.decode([Platforms].self, forKey: .platforms)
        name = try? container.decode(String.self, forKey: .name)
        deck = try? container.decode(String.self, forKey: .deck)
        description = try? container.decode(String.self, forKey: .description)
        expectedReleaseYear = try? container.decode(Int.self, forKey: .expectedReleaseYear)
        dateAdded = try? container.decode(String.self, forKey: .dateAdded)
        guid = try? container.decode(String.self, forKey: .guid)
        dateLastUpdated = try? container.decode(String.self, forKey: .dateLastUpdated)
        id = try? container.decode(Int.self, forKey: .id)
        image = try? container.decode(Image.self, forKey: .image)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(apiDetailUrl, forKey: .apiDetailUrl)
        try? container.encode(numberOfUserReviews, forKey: .numberOfUserReviews)
        try? container.encode(siteDetailUrl, forKey: .siteDetailUrl)
        try? container.encode(imageTags, forKey: .imageTags)
        try? container.encode(aliases, forKey: .aliases)
        try? container.encode(platforms, forKey: .platforms)
        try? container.encode(originalGameRating, forKey: .originalGameRating)
        try? container.encode(name, forKey: .name)
        try? container.encode(deck, forKey: .deck)
        try? container.encode(description, forKey: .description)
        try? container.encode(expectedReleaseYear, forKey: .expectedReleaseYear)
        try? container.encode(dateAdded, forKey: .dateAdded)
        try? container.encode(guid, forKey: .guid)
        try? container.encode(dateLastUpdated, forKey: .dateLastUpdated)
        try? container.encode(id, forKey: .id)
        try? container.encode(image, forKey: .image)
    }
}

class ImageTags: Codable {

    var total: Int?
    var apiDetailUrl: String?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case apiDetailUrl = "api_detail_url"
        case name = "name"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        total = try? container.decode(Int.self, forKey: .total)
        apiDetailUrl = try? container.decode(String.self, forKey: .apiDetailUrl)
        name = try? container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(total, forKey: .total)
        try? container.encode(apiDetailUrl, forKey: .apiDetailUrl)
        try? container.encode(name, forKey: .name)
    }
}

class Platforms: Codable {

    var abbreviation: String?
    var id: Int?
    var apiDetailUrl: String?
    var name: String?
    var siteDetailUrl: String?

    enum CodingKeys: String, CodingKey {
        case abbreviation = "abbreviation"
        case id = "id"
        case apiDetailUrl = "api_detail_url"
        case name = "name"
        case siteDetailUrl = "site_detail_url"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        abbreviation = try? container.decode(String.self, forKey: .abbreviation)
        id = try? container.decode(Int.self, forKey: .id)
        apiDetailUrl = try? container.decode(String.self, forKey: .apiDetailUrl)
        name = try? container.decode(String.self, forKey: .name)
        siteDetailUrl = try? container.decode(String.self, forKey: .siteDetailUrl)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(abbreviation, forKey: .abbreviation)
        try? container.encode(id, forKey: .id)
        try? container.encode(apiDetailUrl, forKey: .apiDetailUrl)
        try? container.encode(name, forKey: .name)
        try? container.encode(siteDetailUrl, forKey: .siteDetailUrl)
    }
}

class OriginalGameRating: Codable {

    var apiDetailUrl: String?
    var name: String?
    var id: Int?

    enum CodingKeys: String, CodingKey {
        case apiDetailUrl = "api_detail_url"
        case name = "name"
        case id = "id"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        apiDetailUrl = try? container.decode(String.self, forKey: .apiDetailUrl)
        name = try? container.decode(String.self, forKey: .name)
        id = try? container.decode(Int.self, forKey: .id)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(apiDetailUrl, forKey: .apiDetailUrl)
        try? container.encode(name, forKey: .name)
        try? container.encode(id, forKey: .id)
    }
}

class Image: Codable {

    var thumbUrl: String?
    var superUrl: String?
    var smallUrl: String?
    var screenUrl: String?
    var iconUrl: String?
    var imageTags: String?
    var originalUrl: String?
    var screenLargeUrl: String?
    var tinyUrl: String?
    var mediumUrl: String?

    enum CodingKeys: String, CodingKey {
        case thumbUrl = "thumb_url"
        case superUrl = "super_url"
        case smallUrl = "small_url"
        case screenUrl = "screen_url"
        case iconUrl = "icon_url"
        case imageTags = "image_tags"
        case originalUrl = "original_url"
        case screenLargeUrl = "screen_large_url"
        case tinyUrl = "tiny_url"
        case mediumUrl = "medium_url"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        thumbUrl = try? container.decode(String.self, forKey: .thumbUrl)
        superUrl = try? container.decode(String.self, forKey: .superUrl)
        smallUrl = try? container.decode(String.self, forKey: .smallUrl)
        screenUrl = try? container.decode(String.self, forKey: .screenUrl)
        iconUrl = try? container.decode(String.self, forKey: .iconUrl)
        imageTags = try? container.decode(String.self, forKey: .imageTags)
        originalUrl = try? container.decode(String.self, forKey: .originalUrl)
        screenLargeUrl = try? container.decode(String.self, forKey: .screenLargeUrl)
        tinyUrl = try? container.decode(String.self, forKey: .tinyUrl)
        mediumUrl = try? container.decode(String.self, forKey: .mediumUrl)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(thumbUrl, forKey: .thumbUrl)
        try? container.encode(superUrl, forKey: .superUrl)
        try? container.encode(smallUrl, forKey: .smallUrl)
        try? container.encode(screenUrl, forKey: .screenUrl)
        try? container.encode(iconUrl, forKey: .iconUrl)
        try? container.encode(imageTags, forKey: .imageTags)
        try? container.encode(originalUrl, forKey: .originalUrl)
        try? container.encode(screenLargeUrl, forKey: .screenLargeUrl)
        try? container.encode(tinyUrl, forKey: .tinyUrl)
        try? container.encode(mediumUrl, forKey: .mediumUrl)
    }
}
