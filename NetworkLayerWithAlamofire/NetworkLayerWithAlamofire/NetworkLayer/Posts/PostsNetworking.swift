//
//  RepositoriesNetworking.swift
//  NetworkLayerWithAlamofire
//
//  Created by Григорий Виняр on 30/08/2022.
//

import Foundation
import Alamofire

enum PostsNetworking {
  case getPosts
  case createPost(title: String, body: String, id: Int, userId: Int)
}

extension PostsNetworking: TargetType {
  var baseURL: String {
    switch self {
    case .getPosts:
      return "https://jsonplaceholder.typicode.com"
    default:
      return ""
    }
  }
  
  var path: String {
    switch self {
    case .getPosts:
      return "/posts"
    case .createPost:
      return "/posts"
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .getPosts:
      return .get
    case .createPost:
      return .post
    }
  }
  
  var task: Task {
    switch self {
    case .getPosts:
      return .requestPlain
    case .createPost(let title, let body, let id, let userId):
      return .requestParameters(parameters: ["title": title, "body": body, "id": id, "userId": userId], encoding: JSONEncoding.default)
    }
  }
  
  var headers: [String : String]? {
    switch self {
    default:
      return [:]
    }
  }
}
