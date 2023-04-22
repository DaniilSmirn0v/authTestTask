//
//  DetailInfoView.swift
//  authTestTask
//
//  Created by Daniil on 19.04.2023.
//

import UIKit

final class DetailInfoView: UIView {
	
	// MARK: - Views
	
	let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFill
		imageView.backgroundColor = .systemBackground
		imageView.isUserInteractionEnabled = true
		
		return imageView
	}()
	
	lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.isPagingEnabled = true
		scrollView.isUserInteractionEnabled = true
		
		return scrollView
	}()
	
	lazy var bottomCollectionView: UICollectionView = {
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createBottomCollectionViewLayout())
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.showsHorizontalScrollIndicator = true
		collectionView.register(PhotoCollectionViewCell.self,
								forCellWithReuseIdentifier: PhotoCollectionViewCell.reuseId)
		
		return collectionView
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
}

// MARK: - Configure view private methods

extension DetailInfoView {
	private func createBottomCollectionViewLayout() -> UICollectionViewCompositionalLayout {
		let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(54),
											  heightDimension: .absolute(54))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		
		let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(54), heightDimension: .absolute(54))
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
		
		let section = NSCollectionLayoutSection(group: group)
		
		section.interGroupSpacing = 2
		section.orthogonalScrollingBehavior = .continuous
		
		let layout = UICollectionViewCompositionalLayout(section: section)
		
		return layout
	}
	
	private func setupHierarchy() {
		[scrollView, bottomCollectionView].forEach { addSubview($0) }
		
		[imageView].forEach { scrollView.addSubview($0) }
	}
	
	private func setupLayout() {
		NSLayoutConstraint.activate([
			scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
			scrollView.centerYAnchor.constraint(equalTo: centerYAnchor),
			scrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
			scrollView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
			
			imageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
			imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
			imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
			imageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
			
			bottomCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34),
			bottomCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
			bottomCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
			bottomCollectionView.heightAnchor.constraint(equalToConstant: 54)
		])
	}
}

// MARK: - DetailViewConfigurableProtocol

extension DetailInfoView: DetailViewConfigurableProtocol {
	func configureView(with viewModel: ViewModel) {
		guard let viewModel = viewModel as? PhotoCollectionCellViewModel else { return }
		downloadImage(urlString: viewModel.image)
	}
	
	private func downloadImage(urlString: String) {
		imageView.getImage(for: urlString)
	}
}
