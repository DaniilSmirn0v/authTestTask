//
//  DetailInfoViewController.swift
//  authTestTask
//
//  Created by Daniil on 19.04.2023.
//

import UIKit

final class DetailInfoViewController: UIViewController {
	
	// MARK: - Views
	
	private var detailInfoView: DetailInfoView! {
		guard isViewLoaded else { return nil }
		return view as? DetailInfoView
	}
	
	// MARK: - Properties
	
	private let presenter: DetailInfoPresenterInputProtocol
	private var cellViewModels: [ViewModel] = []
	private var selectedCellIndex: Int {
		presenter.currentIndex()
	}
	
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
		configureSwipeGestures()
		presenter.configureViewWithCurrentViewModel()
	}
}

// MARK: - Configure View Methods

extension DetailInfoViewController {
	private func configureView() {
		detailInfoView.bottomCollectionView.dataSource = self
		detailInfoView.bottomCollectionView.delegate = self
		view.backgroundColor = .systemBackground
	}
	
	private func configureSwipeGestures() {
		let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
		leftSwipeRecognizer.direction = .left
		
		let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
		rightSwipeRecognizer.direction = .right
		
		let bottomSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didTapBackButton))
		bottomSwipeRecognizer.direction = .down
		
		let zoomGesture = UIPinchGestureRecognizer(target: self, action: #selector(zoomImage(_:)))
		
		detailInfoView.scrollView.addGestureRecognizer(leftSwipeRecognizer)
		detailInfoView.scrollView.addGestureRecognizer(rightSwipeRecognizer)
		detailInfoView.scrollView.addGestureRecognizer(bottomSwipeRecognizer)
		detailInfoView.imageView.addGestureRecognizer(zoomGesture)
		
	}
	
	@objc private func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
		if gesture.direction == .left {
			presenter.nextImageData()
		} else if gesture.direction == .right {
			presenter.prevImageData()
		}
		scrollToVisiblesCells()
	}
	
	@objc func zoomImage(_ gesture: UIPinchGestureRecognizer) {
		if gesture.state == .changed {
			let currentScale = gesture.scale
			let maxScale: CGFloat = 2.0
			let minScale: CGFloat = 0.5
			let scaledTransform = CGAffineTransform(scaleX: currentScale, y: currentScale)
			let limitedTransform = scaledTransform.scaledBy(x: max(minScale, min(maxScale, currentScale)),
															y: max(minScale, min(maxScale, currentScale)))
			UIView.animate(withDuration: 0.2) {
				self.detailInfoView.imageView.transform = limitedTransform
			}
			
		} else if gesture.state == .ended {
			if gesture.scale < 1.0 {
				UIView.animate(withDuration: 0.2) {
					self.detailInfoView.imageView.transform = CGAffineTransform.identity
				}
			}
		}
	}
	
	private func scrollToVisiblesCells() {
		let index = presenter.currentIndex()
		let indexPath = IndexPath(item: index, section: 0)
		detailInfoView.bottomCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
	}
	
	private func configureNavigationBar() {
		let backButtonImageConfiguration = UIImage.SymbolConfiguration(
			pointSize: Constants.DetailModuleConstants.Fonts.navBarFontSize,
			weight: .regular
		)
		let backButtonImage = UIImage(systemName: "chevron.left",
									  withConfiguration: backButtonImageConfiguration)
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage,
														   style: .done,
														   target: self,
														   action: #selector(didTapBackButton))
		navigationItem.leftBarButtonItem?.tintColor = .black
		
		let sharedButtonConfiguration = UIImage.SymbolConfiguration(
			pointSize: Constants.DetailModuleConstants.Fonts.navBarFontSize,
			weight: .regular
		)
		let sharedButtonImage = UIImage(systemName: "square.and.arrow.up",
										withConfiguration: sharedButtonConfiguration)
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: sharedButtonImage,
															style: .plain,
															target: self,
															action: #selector(didTapShareButton))
		navigationItem.rightBarButtonItem?.tintColor = .black
	}
	
	@objc private func didTapBackButton() {
		presenter.popToPhotosViewController()
	}
	
	@objc private func didTapShareButton() {
		guard let cellImage = detailInfoView.imageView.image else { return }
		
		let shareViewController = UIActivityViewController(activityItems: [cellImage],
														   applicationActivities: nil)
		shareViewController.modalPresentationStyle = .overFullScreen
		shareViewController.completionWithItemsHandler = { [weak self] _, success, _, error in
			guard let self = self else { return }
			
			let okAction = UIAlertAction(title: L10n.Alert.Actions.okAction, style: .default)
			
			if error != nil {
				self.showAlert(title: L10n.Alert.errorTitle, message: L10n.Error.unknown, actions: [okAction])
			}
			
			if success {
				let successImageString = "doneIcon"
				let okAction = UIAlertAction(title: L10n.Alert.Actions.okAction, style: .default)
				self.showImageAlert(title: L10n.Alert.successTitle,
									message: "\n\n\n",
									actions: [okAction],
									alertImage: successImageString)
			}
			
		}
		
		present(shareViewController, animated: true)
		
	}
}

// MARK: - DetailInfoPresenterOutputProtocol

extension DetailInfoViewController: DetailInfoPresenterOutputProtocol {
	func configureView(with viewModel: ViewModel) {
		guard let vm = viewModel as? PhotoCollectionCellViewModel else { return }
		title = vm.date
		detailInfoView.configureView(with: viewModel)
	}
	
	func configureCollectionView(with viewModels: [ViewModel]) {
		cellViewModels = viewModels
		DispatchQueue.main.async {
			let indexPath = IndexPath(item: self.selectedCellIndex, section: 0)
			self.detailInfoView.bottomCollectionView.scrollToItem(at: indexPath,
																  at: .centeredHorizontally,
																  animated: true)
			self.detailInfoView.bottomCollectionView.reloadData()
		}
	}
	
	func didSelectCell(with index: Int) {
		presenter.updateCurrentPhoto(index: index)
	}
}

// MARK: - UICollectionViewDataSource

extension DetailInfoViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		cellViewModels.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseId,
															for: indexPath)
				as? PhotoCollectionViewCell else { return UICollectionViewCell() }
		
		guard let viewModel = cellViewModels[indexPath.item] as? CellIdentifiable else { return UICollectionViewCell() }
		
		cell.configure(with: viewModel)
		
		return cell
	}
}

// MARK: - UICollectionViewDelegate

extension DetailInfoViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let index = indexPath.item
		didSelectCell(with: index)
		collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
	}
}
