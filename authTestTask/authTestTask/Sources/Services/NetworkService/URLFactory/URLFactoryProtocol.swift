//
//  URLFactoryProtocol.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation

protocol URLFactoryProtocol {
	func makeURL(baseURL: URL, path: String, queryParameters: [String: String]?) -> URL 
}
