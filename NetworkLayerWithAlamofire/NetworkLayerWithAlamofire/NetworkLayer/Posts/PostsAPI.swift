//
//  RepositoriesAPI.swift
//  NetworkLayerWithAlamofire
//
//  Created by Григорий Виняр on 30/08/2022.
//

import Foundation

protocol PostsAPIProtocol {
  func getPosts(completion: @escaping (Result<[PostModel]?, NSError>) -> Void)
}


class PostsAPI: BaseAPI<PostsNetworking>, PostsAPIProtocol {
  
  //MARK:- Requests
  
  func getPosts(completion: @escaping (Result<[PostModel]?, NSError>) -> Void) {
    self.fetchData(target: .getPosts, responseClass: [PostModel].self) { (result) in
      completion(result)
    }
  }
}
