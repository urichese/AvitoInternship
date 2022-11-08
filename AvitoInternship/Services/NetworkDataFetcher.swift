//
//  NetworkDataFetcher.swift
//  AvitoInternship
//
//  Created by urichese on 06.11.2022.
//

import Foundation

protocol DataFetcher {
    func getEmployees(response:@escaping (Company?) -> Void)
}

struct NetworkDataFetcher:DataFetcher {
    
    let networking: Networking
    
    func getEmployees(response: @escaping (Company?) -> Void) {
        networking.request(url: API.url) { data, error in
            if let error = error {
                print("Error request \(error.localizedDescription)")
                response(nil)
            }
            guard let data = data else { return }
            let decoded = self.decodeJSON(type: EmployeesResponse.self, from: data )
            response(decoded?.company)
        }
    }
    
    private func decodeJSON<T: Decodable> (type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else {return nil}
        return response
        
    }
}
