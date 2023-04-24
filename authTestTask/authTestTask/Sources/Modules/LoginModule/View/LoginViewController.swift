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
		button.setTitle(L10n.Authorization.login, for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: Constants.AuthModuleConstatnts.Fonts.buttonFontSize)
		button.backgroundColor = .black
		button.tintColor = .white
		button.layer.cornerRadius = Constants.AuthModuleConstatnts.Sizes.buttonCornerRadius
		button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
		
		return button
	}()
	
	private let mobileUpLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = L10n.Authorization.title
		label.font = UIFont(name: Constants.AuthModuleConstatnts.Fonts.titleFont,
							size: Constants.AuthModuleConstatnts.Fonts.titleFontSize)
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
			mobileUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
												   constant: Constants.AuthModuleConstatnts.Sizes.labelLeadingAnchor),
			mobileUpLabel.topAnchor.constraint(equalTo: view.topAnchor,
											   constant: Constants.AuthModuleConstatnts.Sizes.labelTopAnchor),
			
			loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
												 constant: Constants.AuthModuleConstatnts.Sizes.buttonLeadingAnchor),
			loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,
												constant: Constants.AuthModuleConstatnts.Sizes.buttonBottomAnchor),
			loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
												  constant: Constants.AuthModuleConstatnts.Sizes.buttonTrailingAnchor),
			loginButton.heightAnchor.constraint(equalToConstant: Constants.AuthModuleConstatnts.Sizes.buttonHeightAnchor)
		])
	}
	
	@objc private func loginButtonTapped() {
		presenter.loginButtonTapped()
	}
}

// MARK: - LoginPresenterOutputProtocol

extension LoginViewController: LoginPresenterOutputProtocol {
}
