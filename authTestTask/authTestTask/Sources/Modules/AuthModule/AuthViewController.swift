//
//  AuthViewController.swift
//  authTestTask
//
//  Created by Daniil on 19.04.2023.
//

import UIKit
import WebKit

class AuthViewController: UIViewController, WKUIDelegate {
	// MARK: - Views
	
	private var webView: WKWebView!
	
	// MARK: - Properties
	
	private let urlString: String
	
	// MARK: - Initialize
	
	init(urlString: String) {
		self.urlString = urlString
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	// MARK: - Life cycle
	
	override func loadView() {
		let webConfig = WKWebViewConfiguration()
		webView = WKWebView(frame: .zero, configuration: webConfig)
		webView.uiDelegate = self
		view = webView
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupWebView()
	}
	
	// MARK: - Private methods
	
	private func setupWebView() {
		guard let url = URL(string: urlString) else { return }
		let request = URLRequest(url: url)
		DispatchQueue.main.async {
			self.webView.load(request)
		}
	}
	
}
