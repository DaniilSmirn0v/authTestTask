//
//  FetchAlbumPhotosApiConstants.swift
//  authTestTask
//
//  Created by Daniil on 22.04.2023.
//

import Foundation
import VK_ios_sdk

struct FetchAlbumPhotosApiConstants {
	static let baseURL = "https://api.vk.com/"
	static let path = "method/photos.get"
	static let versionApi = "5.131"
	static let ownerId = "-128666765"
	static let albumId = "266310117"
	static let token = VKSdk.accessToken().accessToken
}
