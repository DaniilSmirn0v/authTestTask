//
//  PhotoCollectionViewCell.swift
//  authTestTask
//
//  Created by Daniil on 19.04.2023.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
	// MARK: - Properties
	static let reuseId = String(describing: PhotoCollectionViewCell.self)
	
	// MARK: - Views
	var photoImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.clipsToBounds = true
		imageView.contentMode = .scaleAspectFill
		imageView.backgroundColor = .orange
		
		return imageView
	}()
	
	var activityIndicatorView: UIActivityIndicatorView = {
		let activityIndicatorView = UIActivityIndicatorView(style: .medium)
		activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
		activityIndicatorView.color = .black
		activityIndicatorView.hidesWhenStopped = true
		
		return activityIndicatorView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupHierarchy()
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		photoImageView.image = nil
	}
}

extension PhotoCollectionViewCell {
	private func setupHierarchy() {
		[photoImageView, activityIndicatorView].forEach { addSubview($0) }
	}
	
	private func setupLayout() {
		NSLayoutConstraint.activate([
			photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			photoImageView.topAnchor.constraint(equalTo: topAnchor),
			photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
			photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
			activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
	}
}

