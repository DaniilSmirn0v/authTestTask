//
//  NetworkError.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation

enum NetworkError: Error {
	case invalidStatusCode(_ statusCode: Int)
	case emptyData
	case decoding(_ error: Error)
	case unknown
	
	var errorDescription: String {
		switch self {
		case .invalidStatusCode(let statusCode):
			return  L10n.Error.invalidStatusCode(statusCode)
		case .emptyData:
			return L10n.Error.emptyData
		case .decoding(let error):
			return L10n.Error.decoding(error.localizedDescription)
		case .unknown:
			return L10n.Error.unknown
		}
	}
}
