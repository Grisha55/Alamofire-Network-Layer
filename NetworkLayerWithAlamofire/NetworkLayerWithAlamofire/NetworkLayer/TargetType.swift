//
//  TargetType.swift
//  NetworkLayerWithAlamofire
//
//  Created by Григорий Виняр on 30/08/2022.
//

import Foundation
import Alamofire

protocol TargetType {
  var baseURL: String { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var task: Task { get }
  var headers: [String : String]? { get }
}

enum HTTPMethod: String {
  case get = "GET"
  case post = "POST"
  case put = "PUT"
  case delete = "DELETE"
}

enum Task {
  case requestPlain
  case requestParameters(parameters: [String : Any], encoding: ParameterEncoding)
}