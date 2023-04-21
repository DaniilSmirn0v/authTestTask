//
//  FetchAlbumPhotosAPI.swift
//  authTestTask
//
//  Created by Daniil on 20.04.2023.
//

import Foundation
import VK_ios_sdk

struct APIConstants {
	static let baseURL = "https://api.vk.com/"
	static let path = "method/photos.get"
	static let versionApi = "5.131"
	static let ownerId = "-128666765"
	static let albumId = "266310117"
	static let token = VKSdk.accessToken().accessToken
	
}

enum FetchAlbumPhotosAPI {
	case fetchAlbumData
}

extension FetchAlbumPhotosAPI: RequestType {
	var baseURL: URL {
		guard let url = URL(string: APIConstants.baseURL) else { return URL(fileURLWithPath: "") }
		
		return url
	}
	
	var path: String {
		APIConstants.path
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
		guard let token = APIConstants.token else { return [:] }
		return ["owner_id": APIConstants.ownerId,
				"album_id": APIConstants.albumId,
				"access_token": token,
				"v": APIConstants.versionApi]
	}
}
