//
//  Constants.swift
//  authTestTask
//
//  Created by Daniil on 24.04.2023.
//

import Foundation

enum Constants {
	enum AuthModuleConstatnts {
		enum Sizes {
			static let labelTopAnchor: CGFloat = 170
			static let labelLeadingAnchor: CGFloat = 24
			
			static let buttonLeadingAnchor: CGFloat = 16
			static let buttonBottomAnchor: CGFloat = -42
			static let buttonTrailingAnchor: CGFloat = -16
			static let buttonHeightAnchor: CGFloat = 52
			
			static let buttonCornerRadius: CGFloat = 12
		}
		
		enum Fonts {
			static let titleFont: String = "SF Pro Text Bold"
			static let titleFontSize: CGFloat = 44
			
			static let buttonFontSize: CGFloat = 18
		}
	}
	
	enum MainModuleConstants {
		enum Sizes {
			static let spacing: CGFloat = 2
			static let cellItemHeight: CGFloat = 186
			static let cellItemWidth: CGFloat = 186
			static let groupSizeWidth: CGFloat = 1
			static let groupSizeHeight: CGFloat = 186
			static let groupCount: Int = 2
		}
		
		enum Fonts {
			static let navBarFontSize: CGFloat = 17
		}
	}
	
	enum DetailModuleConstants {
		enum Sizes {
			static let collectionViewBottomConstant: CGFloat = -34
			
			static let cellItemHeight: CGFloat = 54
			static let cellItemWidth: CGFloat = 54
			static let interGroupSpacing: CGFloat = 2
		}
		
		enum Fonts {
			static let navBarFontSize: CGFloat = 17
		}
	}
}
