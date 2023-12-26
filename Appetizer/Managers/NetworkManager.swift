//
//  NetworkManager.swift
//  Appetizer
//
//  Created by Mohit Tomer on 23/12/23.
//

import UIKit

final class NetworkManager {
    private init() {}
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    // MARK: - Appetizer List
    
    func getAppetizer(completions: @escaping(Result<[Appetizer], APError>) -> Void) {
        
        guard let url = URL(string: appetizerURL) else {
            completions(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ = error {
                completions(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completions(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completions(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decoderReponse = try decoder.decode(AppetizerResponse.self, from: data)
                completions(.success(decoderReponse.request))
            }catch {
                completions(.failure(.invalidData))
            }
        }
        task.resume()
        
    }
    
    // MARK: - Appetizer Images
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { [self] data, response, error in
            
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
    
}
