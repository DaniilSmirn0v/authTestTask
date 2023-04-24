//
//  RequestType.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation

protocol RequestType {
	var baseURL: URL { get }
	var path: String { get }
	var method: HTTPMethod { get }
	var headers: [String: String] { get }
	var body: Data? { get }
	var queryParameters: [String: String]? { get }
}

enum HTTPMethod: String {
	case get = "GET"
	case post = "POST"
	case put = "PUT"
	case patch = "PATCH"
	case delete = "DELETE"
}
