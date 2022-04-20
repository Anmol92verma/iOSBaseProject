//
//  RandomJokeFromCategory.swift
//  praxis-domain
//
//  Created by Anmol Verma on 20/04/22.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let randomJokeFromCategory = try? newJSONDecoder().decode(RandomJokeFromCategory.self, from: jsonData)

// https://api.chucknorris.io/jokes/random?category=food
// To read values from URLs:
//
//   let task = URLSession.shared.randomJokeFromCategoryTask(with: url) { randomJokeFromCategory, response, error in
//     if let randomJokeFromCategory = randomJokeFromCategory {
//       ...
//     }
//   }
//   task.resume()


public class RandomJokeFromCategory: Codable {
    let categories: [String]
    let createdAt: String
    let iconURL: String
    let id, updatedAt: String
    let url: String
    public let value: String

    enum CodingKeys: String, CodingKey {
        case categories
        case createdAt = "created_at"
        case iconURL = "icon_url"
        case id
        case updatedAt = "updated_at"
        case url, value
    }

    init(categories: [String], createdAt: String, iconURL: String, id: String, updatedAt: String, url: String, value: String) {
        self.categories = categories
        self.createdAt = createdAt
        self.iconURL = iconURL
        self.id = id
        self.updatedAt = updatedAt
        self.url = url
        self.value = value
    }
}
