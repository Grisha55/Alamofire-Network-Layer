//
//  APIConfiguration.swift
//  NetworkLayerWithAlamofire
//
//  Created by Григорий Виняр on 30/08/2022.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
  var method: HTTPMethod { get }
  var path: String { get }
  var parameters: Parameters? { get }
}
