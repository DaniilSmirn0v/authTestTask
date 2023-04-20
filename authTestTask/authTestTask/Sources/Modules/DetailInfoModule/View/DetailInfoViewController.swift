//
//  DetailInfoViewController.swift
//  authTestTask
//
//  Created by Daniil on 19.04.2023.
//

import UIKit

class DetailInfoViewController: UIViewController {
	// MARK: - Views
	
	private var detailInfoView: DetailInfoView? {
		guard isViewLoaded else { return nil }
		return view as? DetailInfoView
	}
	
	// MARK: - Properties
	
	private var presenter: DetailInfoPresenterInputProtocol
	
	// MARK: - Initialize
	
	init(presenter: DetailInfoPresenterInputProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - LifeCycle
	
	override func loadView() {
		view = DetailInfoView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureView()
		configureNavigationBar()
	}
}

extension DetailInfoViewController {
	private func configureView() {
		detailInfoView?.collectionView.dataSource = self
		detailInfoView?.collectionView.delegate = self
		view.backgroundColor = .systemBackground
	}
	
	private func configureNavigationBar() {
		let backButtonImageConfiguration = UIImage.SymbolConfiguration(pointSize: 15, weight: .regular)
		let backButtonImage = UIImage(systemName: "chevron.left",
									  withConfiguration: backButtonImageConfiguration)
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage,
														   style: .done,
														   target: self,
														   action: #selector(didTapBackButton))
		navigationItem.leftBarButtonItem?.tintColor = .black
		
		let sharedButtonConfiguration = UIImage.SymbolConfiguration(pointSize: 15, weight: .regular)
		let sharedButtonImage = UIImage(systemName: "square.and.arrow.up",
										withConfiguration: sharedButtonConfiguration)
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: sharedButtonImage,
															style: .plain,
															target: self,
															action: #selector(didTapShareButton))
		navigationItem.rightBarButtonItem?.tintColor = .black
	}
	
	@objc private func didTapBackButton() {
		navigationController?.popViewController(animated: true)
	}
	
	@objc private func didTapShareButton() {
		let actionSheetMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
		
		let saveAction = UIAlertAction(title: "Сохранить", style: .default) { _ in
			print("saved")
		}
		
		let shareAction = UIAlertAction(title: "Поделиться", style: .default) { _ in
			print("shared")
		}
		let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
		
		actionSheetMenu.addAction(shareAction)
		actionSheetMenu.addAction(saveAction)
		actionSheetMenu.addAction(cancelAction)
		
		present(actionSheetMenu, animated: true)
	}
}

// MARK: - DetailInfoPresenterOutputProtocol

extension DetailInfoViewController: DetailInfoPresenterOutputProtocol {
	
}

// MARK: - UICollectionViewDelegate

extension DetailInfoViewController: UICollectionViewDelegate {
	
}

// MARK: - UICollectionViewDataSource

extension DetailInfoViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		30
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseId, for: indexPath)
				as? PhotoCollectionViewCell else { return UICollectionViewCell() }
		
		return cell
	}
}
