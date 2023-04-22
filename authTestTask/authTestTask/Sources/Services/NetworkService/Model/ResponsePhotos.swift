//
//  ResponsePhotos.swift
//  authTestTask
//
//  Created by Daniil on 21.04.2023.
//

import Foundation

struct ResponsePhotos: Decodable {
	let response: PhotosData
}
struct PhotosData: Decodable {
	let items: [PhotosItem]
}

struct PhotosItem: Decodable {
	let id: Int
	let date: Int
	let sizes: [Size]
}

struct Size: Decodable {
	let url: String
}
