//
//  NetworkService.swift
//  authTestTask
//
//  Created by Daniil on 21.04.2023.
//

import Foundation

final class NetworkService: NetworkServiceProtocol {
	// MARK: - Properties
	
	private static let decoder: JSONDecoder = {
		let decoder = JSONDecoder()
		return decoder
	}()
	
	private let urlSession: URLSession
	private let requestFactory: RequestFactory
	
	// MARK: - Initialize
	
	public init(urlSession: URLSession = .shared, requestFactory: RequestFactory = RequestFactory(urlFactory: DefaultURLFactory())) {
		self.urlSession = urlSession
		self.requestFactory = requestFactory
	}
	
	// MARK: - NetworkClientProtocol
	
	func fetchPhotoAlbumData(request: RequestType, completion: @escaping (Result<ResponsePhotos, NetworkError>) -> Void) {
		perform(request: request, completion: completion)
	}
}

// MARK: - Private methods

extension NetworkService {
	private func perform<T: Decodable>(request: RequestType, completion: @escaping (Result<T, NetworkError>) -> Void) {
		
		let urlRequest = requestFactory.makeRequest(request: request)
		
		urlSession.dataTask(with: urlRequest) { data, response, error in
			if error != nil {
				completion(.failure(.unknown))
			}
			
			if let response = response as? HTTPURLResponse,
			   !(200...299).contains(response.statusCode) {
				completion(.failure(.invalidStatusCode(response.statusCode)))
			}
			
			guard let data = data else {
				completion(.failure(NetworkError.emptyData))
				return
			}
			
			do {
				let result = try Self.decoder.decode(T.self, from: data)
				completion(.success(result))
			} catch {
				completion(.failure(NetworkError.decoding(error)))
			}
		}.resume()
	}
}
