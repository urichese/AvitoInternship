//
//  NetworkDataFetcher.swift
//  AvitoInternship
//
//  Created by urichese on 06.11.2022.
//

import Foundation

protocol DataFetcher {
	func getEmployees(completion:@escaping (Result<Company, NetworkError>) -> Void)
}

struct NetworkDataFetcher:DataFetcher {

	// MARK: - Properties

	private let cache = Cache<String, Company>()
	let networking: Networking

	// MARK: - Methods

	func getEmployees(completion: @escaping (Result<Company, NetworkError>) -> Void) {

		if let company = cache[API.url] {
			return completion(.success(company))
		}
		networking.request(url: API.url) { data, response, error in

			if let error = error {
				let nsError = error as NSError
				if nsError.domain == NSURLErrorDomain, nsError.code == -1009 {
					completion(.failure(NetworkError.noInternetConnection))
					return
				}

				if nsError.domain == NSURLErrorDomain, nsError.code == -1001 {
					completion(.failure(NetworkError.timeout))
				}

				completion(.failure(NetworkError.networkError))
				return
			}

			guard response != nil else {
				completion(.failure(NetworkError.responseError))
				return
			}

			guard let data = data else {
				completion(.failure(NetworkError.networkError))
				return
			}
			let decoded = self.decodeJSON(type: EmployeesResponse.self, from: data )

			if let company = decoded?.company {
				completion(.success(company))
				cache[API.url] = company
			}

		}
	}

	// MARK: - Private methods

	private func decodeJSON<T: Decodable> (type: T.Type, from: Data?) -> T? {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		guard let data = from, let response = try? decoder.decode(type.self, from: data) else {return nil}
		return response
	}
}

// MARK: - NetworkError

enum NetworkError: Error {
	case networkError
	case timeout
	case responseError
	case noInternetConnection
}
