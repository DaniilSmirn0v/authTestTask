//
//  AuthServiceProtocol.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation

protocol AuthServiceProtocol: AnyObject {
	var delegate: AuthServiceDelegate? { get set }
	func authStart()
	func authEndSession()
}
