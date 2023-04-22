//
//  RequestFactory.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation

struct RequestFactory {
	// MARK: - Properties
	
	let urlFactory: URLFactoryProtocol
	
	// MARK: - Factory Api
	
	func makeRequest(request: RequestType) -> URLRequest {
		let url = urlFactory.makeURL(baseURL: request.baseURL, path: request.path, queryParameters: request.queryParameters)
		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = request.method.rawValue
		urlRequest.allHTTPHeaderFields = request.headers
		urlRequest.httpBody = request.body
		urlRequest.cachePolicy = .returnCacheDataElseLoad
		urlRequest.timeoutInterval = 20
		
		return urlRequest
	}
}
