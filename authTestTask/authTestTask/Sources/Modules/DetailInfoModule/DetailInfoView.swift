//
//  DetailInfoView.swift
//  authTestTask
//
//  Created by Daniil on 19.04.2023.
//

import UIKit

class DetailInfoView: UIView {
	// MARK: - Views
	private let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFill
		imageView.backgroundColor = .red
		
		return imageView
	}()
	
	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.minimumZoomScale = 1.0
		scrollView.maximumZoomScale = 4.0
		scrollView.showsVerticalScrollIndicator = false
		scrollView.showsHorizontalScrollIndicator = false
		scrollView.bounces = false
		scrollView.backgroundColor = .orange
		
		return scrollView
	}()
	
	lazy var collectionView: UICollectionView = {
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createLayout())
		collectionView.translatesAutoresizingMaskIntoConstraints = false
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

extension DetailInfoView {
	private func createLayout() -> UICollectionViewCompositionalLayout {
		let itemSize = NSCollectionLayoutSize(
			widthDimension: .absolute(54), heightDimension: .absolute(54))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
	
		let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(54), heightDimension: .absolute(54))
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitems: [item])
		group.interItemSpacing = NSCollectionLayoutSpacing.fixed(2)
			
		let section = NSCollectionLayoutSection(group: group)
			
		section.interGroupSpacing = 2
		section.orthogonalScrollingBehavior = .continuous
		
		return UICollectionViewCompositionalLayout(section: section)
	}
	
	private func setupHierarchy() {
		[scrollView, collectionView].forEach { addSubview($0) }
		
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
			
			collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34),
			collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
			collectionView.heightAnchor.constraint(equalToConstant: 54)
		])
	}
}
