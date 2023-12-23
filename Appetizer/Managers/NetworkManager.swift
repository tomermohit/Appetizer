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
    
}
