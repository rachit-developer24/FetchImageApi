//
//  ServiceImage.swift
//  FetchImageApi
//
//  Created by Rachit Sharma on 21/07/2025.
//

import Foundation
import UIKit
class serviceimage{
    func fetchimage()async throws -> UIImage{
        let urlstring = "https://picsum.photos/200"
        guard let url = URL(string: urlstring)else{
            throw URLError(.badURL)
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse else{
            throw URLError(.badServerResponse)
        }
        guard response.statusCode == 200 else{
            throw URLError(.badServerResponse)
        }
      guard let image = UIImage(data: data)else{
            throw URLError(.badURL)}
        return image
        
        
    }
}
