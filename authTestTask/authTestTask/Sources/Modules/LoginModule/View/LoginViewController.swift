//
//  LoginViewController.swift
//  authTestTask
//
//  Created by Daniil on 19.04.2023.
//

import UIKit

final class LoginViewController: UIViewController {
	
	// MARK: - Views
	
	private lazy var loginButton: UIButton = {
		let button = UIButton(type: .system)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Вход через VK", for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 18)
		button.backgroundColor = .black
		button.tintColor = .white
		button.layer.cornerRadius = 12
		button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
		
		return button
	}()
	
	private let mobileUpLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Mobile Up\nGallery"
		label.font = UIFont(name: "SF Pro Text Bold", size: 44)
		label.numberOfLines = 2

		return label
	}()
	
	// MARK: - Properties
	
	private var presenter: LoginPresenterInputProtocol
	
	// MARK: - Initialize
	
	init(presenter: LoginPresenterInputProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Life cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureView()
		setupHierarchy()
		setupLayout()
	}
}

// MARK: - Private methods configure view

extension LoginViewController {
	private func configureView() {
		view.backgroundColor = .systemBackground
	}
	
	private func setupHierarchy() {
		[loginButton, mobileUpLabel].forEach { view.addSubview($0) }
	}
	
	private func setupLayout() {
		NSLayoutConstraint.activate([
			mobileUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
			mobileUpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
			
			loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -42),
			loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
			loginButton.heightAnchor.constraint(equalToConstant: 52)
		])
	}
	
	@objc private func loginButtonTapped() {
		presenter.loginButtonTapped()
	}
}

// MARK: - LoginPresenterOutputProtocol

extension LoginViewController: LoginPresenterOutputProtocol {
}
