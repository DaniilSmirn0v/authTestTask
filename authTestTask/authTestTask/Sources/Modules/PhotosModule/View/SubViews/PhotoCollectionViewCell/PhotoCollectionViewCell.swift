//
//  PhotoCollectionViewCell.swift
//  authTestTask
//
//  Created by Daniil on 19.04.2023.
//

import UIKit

final class PhotoCollectionViewCell: BaseCollectionViewCell {
	// MARK: - Properties
	
	static let reuseId = String(describing: PhotoCollectionViewCell.self)
	private var imageUrl: String?
	private let imageLoader = ImageLoader.shared
	
	// MARK: - Views
	
	private var photoImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.clipsToBounds = true
		imageView.contentMode = .scaleAspectFill
		imageView.backgroundColor = .systemGray
		
		return imageView
	}()
	
	private var activityIndicatorView: UIActivityIndicatorView = {
		let activityIndicatorView = UIActivityIndicatorView(style: .medium)
		activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
		activityIndicatorView.color = .systemBackground
		activityIndicatorView.hidesWhenStopped = true
		
		return activityIndicatorView
	}()
	
	// MARK: - Initialize
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupHierarchy()
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - prepareForReuse()
	
	override func prepareForReuse() {
		super.prepareForReuse()
		imageUrl = nil
		photoImageView.image = nil
	}
	
	// MARK: - BaseCollectionViewCell API
	
	override func configure(with model: CellIdentifiable?) {
		activityIndicatorView.startAnimating()
		guard let viewModel = model as? PhotoCollectionCellViewModel else { return }
		self.imageUrl = viewModel.image
		downloadImage(urlString: imageUrl ?? "")
	}
}

// MARK: - Configure view private methods

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
	
	private func downloadImage(urlString: String) {
		imageLoader.getImage(from: urlString) { image in
			DispatchQueue.main.async { [weak self] in
				guard let self = self,
					  self.imageUrl == urlString else {
					return
				}
				
				self.photoImageView.image = image
				
				if self.photoImageView.image != nil {
					self.activityIndicatorView.stopAnimating()
				}
			}
		}
	}
}
