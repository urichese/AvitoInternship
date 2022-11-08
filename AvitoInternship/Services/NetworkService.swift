//
//  NetworkService.swift
//  AvitoInternship
//
//  Created by urichese on 06.11.2022.
//

import Foundation

protocol Networking {
    func request(url: String, completion: @escaping (Data?, URLResponse?, Error?)->Void)
}

final class NetworkService:Networking {
    
    func request(url: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            completion(data, response, error)
        })
    }
}
