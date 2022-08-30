//
//  BaseAPI.swift
//  NetworkLayerWithAlamofire
//
//  Created by Григорий Виняр on 30/08/2022.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType> {
  
  func fetchData<M: Decodable>(target: T, responseClass: M.Type, completionHandler: @escaping (Result<M, NSError>) -> Void) {
    
    let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
    let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
    let parameters = buildParams(task: target.task)
    
    AF.request(target.baseURL + target.path, method: method, parameters: parameters.0, encoding: parameters.1, headers: headers).responseJSON { response in
      
      guard let statusCode = response.response?.statusCode else {
        print("StatusCode not found")
        completionHandler(Result.failure(NSError()))
        return
      }
      
      if statusCode == 200 {
        guard let jsonResponse = try? response.result.get() else {
          print("jsonResponse error")
          completionHandler(Result.failure(NSError()))
          return
        }
        
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else {
          print("theJSONData error")
          return
        }
        
        guard let responseObject = try? JSONDecoder().decode(M.self, from: theJSONData) else {
          print("responseObject error")
          completionHandler(Result.failure(NSError()))
          return
        }
        
        completionHandler(Result.success(responseObject))
      } else {
        print("Error: statusCode is \(statusCode)")
        completionHandler(Result.failure(NSError()))
      }
    }
  }
  
  private func buildParams(task: Task) -> ([String : Any], ParameterEncoding) {
    switch task {
    case .requestPlain:
      return ([:], URLEncoding.default)
    case .requestParameters(parameters: let parameters, encoding: let encoding):
      return (parameters, encoding)
    }
  }
}
