//
//  PhotosViewController.swift
//  authTestTask
//
//  Created by Daniil on 19.04.2023.
//

import UIKit

class PhotosViewController: UIViewController {
	// MARK: - Views
	
	private var photoView: PhotoCollectionView! {
		guard isViewLoaded else { return nil }
		return view as? PhotoCollectionView
	}
	
	// MARK: - Properties
	
	private var presenter: PhotosPresenterInputProtocol
	
	// MARK: - Initialize
	
	init(presenter: PhotosPresenterInputProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Life cycle
	
	override func loadView() {
		view = PhotoCollectionView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureView()
		configureNavigationBar()
	}
}

extension PhotosViewController {
	private func configureView() {
		photoView.collectionView.dataSource = self
		photoView.collectionView.delegate = self
		photoView.backgroundColor = .systemBackground
	}
	
	private func configureNavigationBar() {
		title = "Mobile UP Gallery"
		
		navigationController?.navigationBar.titleTextAttributes = [
			NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .medium)
		]
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Выход",
															style: .plain,
															target: self,
															action: #selector(didTapExitButton))
		navigationItem.rightBarButtonItem?.tintColor = .black
		navigationItem.rightBarButtonItem?.setTitleTextAttributes(
			[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .regular)], for: .normal
		)
	}
	
	@objc func didTapExitButton() {
		presenter.exitButtonTapped()
	}
}

// MARK: - PhotosPresenterOutputProtocol

extension PhotosViewController: PhotosPresenterOutputProtocol {
	
}

// MARK: - UICollectionViewDelegate

extension PhotosViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//		let vc = DetailInfoViewController()
//		navigationController?.pushViewController(vc, animated: true)
	}
}

// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		50
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseId,
															for: indexPath)
				as? PhotoCollectionViewCell else { return UICollectionViewCell() }
		
		cell.photoImageView.backgroundColor = .red
		
		return cell
	}
}
