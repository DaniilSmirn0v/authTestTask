//
//  PhotoCollectionView.swift
//  authTestTask
//
//  Created by Daniil on 19.04.2023.
//

import UIKit

final class PhotoCollectionView: UIView {
	
	// MARK: - Views
	
	lazy var collectionView: UICollectionView = {
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupCompositionalLayout())
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(PhotoCollectionViewCell.self,
								forCellWithReuseIdentifier: PhotoCollectionViewCell.reuseId)
		
		collectionView.showsVerticalScrollIndicator = false
		
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

// MARK: - Configure view methods

extension PhotoCollectionView {
	
	private func setupCompositionalLayout() -> UICollectionViewLayout {
		let spacing = Constants.MainModuleConstants.Sizes.spacing
		
		let itemSize = NSCollectionLayoutSize(widthDimension:
				.absolute(Constants.MainModuleConstants.Sizes.cellItemWidth),
											  heightDimension:
				.absolute(Constants.MainModuleConstants.Sizes.cellItemHeight))
		
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		
		let groupSize = NSCollectionLayoutSize(widthDimension:
				.fractionalWidth(Constants.MainModuleConstants.Sizes.groupSizeWidth),
											   heightDimension:
				.absolute(Constants.MainModuleConstants.Sizes.groupSizeHeight))
		
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
													   subitem: item,
													   count: Constants.MainModuleConstants.Sizes.groupCount)
		
		group.interItemSpacing = .fixed(spacing)
		
		let section = NSCollectionLayoutSection(group: group)
		section.interGroupSpacing = spacing
		
		let layout = UICollectionViewCompositionalLayout(section: section)
		
		return layout
	}
	
	private func setupHierarchy() {
		addSubview(collectionView)
	}
	
	private func setupLayout() {
		NSLayoutConstraint.activate([
			collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
			collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
