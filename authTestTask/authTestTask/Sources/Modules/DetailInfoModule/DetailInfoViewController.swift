//
//  DetailInfoViewController.swift
//  authTestTask
//
//  Created by Daniil on 19.04.2023.
//

import UIKit

class DetailInfoViewController: UIViewController {
	// MARK: - Views
	private var detailInfoView: DetailInfoView! {
		guard isViewLoaded else { return nil }
		return view as? DetailInfoView
	}
	
	// MARK: - Properties
	
	// MARK: - Initialize
	
	// MARK: - LifeCycle
	override func loadView() {
		view = DetailInfoView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureView()
	}
}

extension DetailInfoViewController {
	private func configureView() {
		detailInfoView.collectionView.dataSource = self
		detailInfoView.collectionView.delegate = self
		view.backgroundColor = .systemBackground
	}
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
