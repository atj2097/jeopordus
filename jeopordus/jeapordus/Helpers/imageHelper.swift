//
//  imageHelper.swift
//  jeapordus
//
//  Created by albert coelho oliveira on 9/16/19.
//  Copyright © 2019 Jeapordus Team. All rights reserved.
//

import Foundation
import UIKit
class ImageHelper {
    // Singleton instance to have only one instance in the app of the imageCache
    private init() {}
    static let shared = ImageHelper()
    
    
    func fetchImage(urlString: String, completionHandler: @escaping (Result<UIImage,AppError>) -> ()) {
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badUrl))
            return
        }
        let request = URLRequest.init(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(.badUrl))
            } else if let data = data {
                let foto = UIImage.init(data: data)
                completionHandler(.success(foto!))
            }
            }.resume()
    }
    
}
