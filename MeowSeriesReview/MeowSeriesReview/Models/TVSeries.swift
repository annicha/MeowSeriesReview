//
//  TVSeries.swift
//  MeowSeriesReview
//
//  Created by Anne on 18/10/21.
//

import Foundation

struct TVSeriesDictionary: Codable {
	let results: [TVSeries]
	let totalPages: Int
	
	private enum CodingKeys: String, CodingKey {
		case results
		case totalPages = "total_pages"
	}
}

struct TVSeries: Codable {
	let name: String
	let summary: String
	let imagePath: String?
	let backDropPath: String?
	
	private enum CodingKeys: String, CodingKey {
		case name
		case summary = "overview"
		case imagePath = "poster_path"
		case backDropPath = "backdrop_path"
	}
}
