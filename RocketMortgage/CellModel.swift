//
//  CellModel.swift
//  RocketMortgage
//
//  Created by Alexander Fallah on 9/21/22.
//

import Foundation
class CellModel {
    private (set)var title = ""
    let imageURL: URL
    var isValid: Bool { !title.isEmpty && !imageURL.absoluteString.isEmpty}
    init?(title: String?, imageURL: URL?) {
        guard let title = title, !(imageURL?.absoluteString.isEmpty ?? true), let imageURL = imageURL else { return nil }
        self.title = title
        self.imageURL = imageURL
    }
}
