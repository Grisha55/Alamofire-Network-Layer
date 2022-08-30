//
//  ViewController.swift
//  NetworkLayerWithAlamofire
//
//  Created by Григорий Виняр on 30/08/2022.
//

import UIKit

class ViewController: UIViewController {

  let api = PostsAPI()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemGreen
    
    api.getPosts { result in
      switch result {
      case .failure(let error):
        print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
      case .success(let posts):
        guard let posts = posts else { return }
        for post in posts {
          print("Post number \(post.id) with title: \(post.title)")
        }
      }
    }
  }


}

