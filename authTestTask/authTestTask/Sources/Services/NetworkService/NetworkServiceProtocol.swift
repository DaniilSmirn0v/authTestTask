//
//  NetworkServiceProtocol.swift
//  authTestTask
//
//  Created by Daniil on 21.04.2023.
//

import Foundation

protocol NetworkServiceProtocol {
	func fetchPhotoAlbumData(request: RequestType,
							 completion: @escaping (Result<ResponsePhotos, NetworkError>) -> Void)
}
