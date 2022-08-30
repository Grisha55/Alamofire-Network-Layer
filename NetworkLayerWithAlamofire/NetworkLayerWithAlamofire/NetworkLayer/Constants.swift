//
//  Constants.swift
//  NetworkLayerWithAlamofire
//
//  Created by Григорий Виняр on 30/08/2022.
//

import Foundation

struct K {
  struct ProductionServer {
    static let baseURL = ""
  }
  
  struct APIParameterKey {
    static let password = "password"
    static let email = "email"
  }
}

enum HTTPHeaderField: String {
  case authentication = "Authorization"
  case contentType = "Content-Type"
  case acceptType = "Accept"
  case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
  case json = "application/json"
}
