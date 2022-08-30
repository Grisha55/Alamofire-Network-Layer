//
//  PostModel.swift
//  NetworkLayerWithAlamofire
//
//  Created by Григорий Виняр on 30/08/2022.
//

import Foundation

struct PostModel: Codable {
  var userId: Int
  var id: Int
  var title: String
  var body: String
}
