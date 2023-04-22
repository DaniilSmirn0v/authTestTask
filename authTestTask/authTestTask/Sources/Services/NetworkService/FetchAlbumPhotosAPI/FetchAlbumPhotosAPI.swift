//
//  FetchAlbumPhotosAPI.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation

enum FetchAlbumPhotosAPI {
	case fetchAlbumData
}

// MARK: - RequestType

extension FetchAlbumPhotosAPI: RequestType {
	var baseURL: URL {
		guard let url = URL(string: FetchAlbumPhotosApiConstants.baseURL) else { return URL(fileURLWithPath: "") }
		
		return url
	}
	
	var path: String {
		FetchAlbumPhotosApiConstants.path
	}
	
	var method: HTTPMethod {
		.get
	}
	
	var headers: [String: String] {
		[:]
	}
	
	var body: Data? {
		nil
	}
	
	var queryParameters: [String: String]? {
		guard let token = FetchAlbumPhotosApiConstants.token else { return [:] }
		return ["owner_id": FetchAlbumPhotosApiConstants.ownerId,
				"album_id": FetchAlbumPhotosApiConstants.albumId,
				"access_token": token,
				"v": FetchAlbumPhotosApiConstants.versionApi]
	}
}
