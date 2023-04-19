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
	
	// MARK: - Initialize
	
	// MARK: - Life cycle
	override func loadView() {
		view = PhotoCollectionView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureView()
	}
}

extension PhotosViewController {
	private func configureView() {
		photoView.collectionView.dataSource = self
		photoView.collectionView.delegate = self
	}
}

extension PhotosViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print(indexPath.item)
	}
}

extension PhotosViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		50
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseId, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
		
		cell.photoImageView.backgroundColor = .red
		
		return cell
	}
	
	
}
