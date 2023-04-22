//
//  DefaultURLFactory.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation

struct DefaultURLFactory: URLFactoryProtocol {
	func makeURL(baseURL: URL, path: String, queryParameters: [String: String]?) -> URL {
		var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)
		
		components?.queryItems = queryParameters?.map {
			URLQueryItem(name: $0, value: $1)
		}
		
		return components?.url ?? baseURL.appendingPathComponent(path)
	}
}
