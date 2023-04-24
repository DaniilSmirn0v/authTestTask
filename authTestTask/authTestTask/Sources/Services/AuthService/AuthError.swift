//
//  AuthError.swift
//  authTestTask
//
//  Created by Daniil on 24.04.2023.
//

import Foundation

enum AuthError: Error {
	case authError
	
	public var errorDescription: String? {
		switch self {
		case .authError:
			return NSLocalizedString("Authorization Failed.", comment: "Description for failed auth.")
		}
	}
}
