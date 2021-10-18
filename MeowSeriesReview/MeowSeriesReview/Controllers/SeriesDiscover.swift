//
//  SeriesDiscover.swift
//  MeowSeriesReview
//
//  Created by Anne on 18/10/21.
//

import UIKit

class SeriesController {

	static let shared = SeriesController()
	let posterCache = NSCache<NSString, UIImage>()
	let backdropCache =  NSCache<NSString, UIImage>()
	var lastPage: Int?
	
	
	private init(){}
	
	let baseURL = URL(string: "https://api.themoviedb.org/3/")
	let imageBaseURL = URL(string: "https://image.tmdb.org/t/p/")
	
	func fetchTrendingSeries(page: Int, completion: @escaping (Result<[TVSeries], MSRError>) -> Void){
		
		if let lastPage = lastPage {
			if page > lastPage {
				completion(.failure(.endOfResults)); return
			}
		}
		
		var discoverURL = baseURL?.appendingPathComponent("discover")
		discoverURL?.appendPathComponent("tv")
		
		guard let url = discoverURL else {
			completion(.failure(.invalidURL)); return
		}
		
		var components = URLComponents.init(url: url, resolvingAgainstBaseURL: true)
		let pageQuery = URLQueryItem(name: "page", value: String(page))
		let apiKeyQuery = URLQueryItem(name: "api_key", value: SecretKeys.movieDBAPIKey)
		
		components?.queryItems = [pageQuery, apiKeyQuery]

		/* Data Task*/
		guard let endPointURL = components?.url else {
			completion(.failure(.invalidURL)); return
		}
		
		URLSession.shared.dataTask(with: endPointURL) { (data, response, error) in
			if let error = error {
				print("\(error.localizedDescription) \(error) in function \(#function)")
				completion(.failure(.unableToComplete))
				return
			}
			
			guard let response = response as? HTTPURLResponse,
				  response.statusCode == 200 else {
					  completion(.failure(.invalidResponse))
					  return
			}
			
			
			guard let data = data else {
				print("Cannot unwrap data in \(#function) 😡")
				completion(.failure(.invalidData)); return
			}
			
			do {
				let decoder = JSONDecoder()
				let topLevelDict = try decoder.decode(TVSeriesDictionary.self, from: data)
				self.lastPage = topLevelDict.totalPages
				completion(.success(topLevelDict.results))
			} catch {
				completion(.failure(.invalidData))
			}
		}.resume()
	}
	
	func fetchPoster(fromPath filePath: String, completion: @escaping (Result<UIImage, MSRError>) -> Void) {
		let imageSize = "w185"
		var urlForPoster = imageBaseURL?.appendingPathComponent(imageSize)
		urlForPoster?.appendPathComponent(filePath)
		
		guard let url = urlForPoster else {
			completion(.failure(.invalidURL)); return
		}
		
		/* Create dataTask */
		URLSession.shared.dataTask(with: url) { (data, _, error) in
			if let error = error {
				print("\(error.localizedDescription) \(error) in function \(#function)")
				completion(.failure(.unableToComplete)); return
			}
			
			guard let data = data else {
				completion(.failure(.invalidData)); return
			}
			
			if let image = UIImage(data: data) {
				completion(.success(image))
			} else {
				completion(.failure(.invalidData)); return
			}
		}.resume()
	}
}
