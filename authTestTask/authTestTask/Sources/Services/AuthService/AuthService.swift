//
//  AuthService.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation
import VK_ios_sdk

protocol AuthServiceDelegate: AnyObject {
	func authInit()
	func authServiceShouldPresent(viewController: UIViewController)
	func authServiceDidFinish()
	func authServiceDidFail(with error: Error)
	func authUserDidLogOut()
}

class AuthService: NSObject, AuthServiceProtocol {
	
	// MARK: - Properties
	
	private let appId = "51619721"
	private let scope = ["offline"]
	private let vkSdk: VKSdk
	weak var delegate: AuthServiceDelegate?
	
	// MARK: - Initialize
	
	override init() {
		vkSdk = VKSdk.initialize(withAppId: appId)
		super.init()
		vkSdk.register(self)
		vkSdk.uiDelegate = self
	}
	
	func wakeUpSession() {
		VKSdk.wakeUpSession(scope) { [weak self] state, error in
			guard let self = self else { return }
			
			if let error = error {
				self.delegate?.authServiceDidFail(with: error)
				return
			}
			
			switch state {
			case .initialized:
				self.delegate?.authInit()
			case .authorized:
				self.delegate?.authServiceDidFinish()
			default:
				self.delegate?.authUserDidLogOut()
			}
		}
	}
	
	// MARK: - AuthServiceProtocol
	
	func authStart() {
		VKSdk.authorize(scope)
	}
	
	func authEndSession() {
		delegate?.authUserDidLogOut()
	}
}

// MARK: - VKSdkDelegate

extension AuthService: VKSdkDelegate {
	func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
		if result.token != nil {
			delegate?.authServiceDidFinish()
		} else if let error = result.error {
			delegate?.authServiceDidFail(with: error)
		}
	}
	
	func vkSdkUserAuthorizationFailed() {
		delegate?.authUserDidLogOut()
	}
}

// MARK: - VKSdkUIDelegate

extension AuthService: VKSdkUIDelegate {
	func vkSdkShouldPresent(_ controller: UIViewController!) {
		delegate?.authServiceShouldPresent(viewController: controller)
	}
	
	func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
		print(#function)
	}
}
