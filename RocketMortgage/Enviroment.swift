//
//  Enviroment.swift
//  DisneyApp
//
//  Created by Alexander Fallah on 9/19/22.
//

import Foundation
public extension Dictionary {
  static func += (lhs: inout Dictionary, rhs: Dictionary) {
    lhs.merge(rhs) { (_, new) in new }
  }
}

class Enviroment {

    // MARK: Lifecycle

    init() {
        loadEnvFile()
    }

    // MARK: Internal

    enum Key: String, CaseIterable {
        case API_KEY
    }

    static func get(_ key: Key) -> String {
        shared.vars[key.rawValue] ?? ""
    }

    // MARK: Private

    private static let shared = Enviroment()

    private var vars = [String: String]()

    private func loadEnvFile() {
        let envVariables = ProcessInfo.processInfo.environment
        vars += envVariables

        
        let missingKeys = Key.allCases.compactMap { vars[$0.rawValue]?.isEmpty == true ? $0.rawValue : nil }
        guard missingKeys.count == 0 else {
            let missingKeysString = missingKeys.joined(separator: "\n")
            fatalError("Missing environment variables in your scheme file: \(missingKeysString)\n")
        }
    }
}
