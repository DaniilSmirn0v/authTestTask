//
//  DetailViewConfigurableProtocol.swift
//  authTestTask
//
//  Created by Daniil on 21.04.2023.
//

import UIKit

protocol DetailViewConfigurableProtocol where Self: UIView {
	func configureView(with viewModel: ViewModel)
}
