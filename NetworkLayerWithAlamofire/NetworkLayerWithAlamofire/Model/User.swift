//
//  User.swift
//  NetworkLayerWithAlamofire
//
//  Created by Григорий Виняр on 30/08/2022.
//

import Foundation

struct Article: Codable {
  let id: Int
  let title: String
  let image: URL
  let author : String
  let categories: [Category]
  let datePublished: Date
  let body: String?
  let publisher: String?
  let url: URL?
}

struct Category: Codable {
  let id: Int
  let name: String
  let parentID: Int?
}

struct User: Codable {
  let firstName: String
  let lastName: String
  let email: String
  let image: URL
}

extension Category {
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case parentID = "parent_id"
  }
}
