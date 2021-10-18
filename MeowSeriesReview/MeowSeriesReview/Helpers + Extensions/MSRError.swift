//
//  MSRError.swift
//  MeowSeriesReview
//
//  Created by Anne on 18/10/21.
//

import Foundation

enum MSRError: String, Error {
	case endOfResults		= "There's no more data to show."
	case unableToComplete 	= "Unable to complete your request. Please check your internet connection."
	case invalidURL			= "Invalid URL. Please contact developer."
	case invalidResponse 	= "Invalid response from the server. Please try again."
	case invalidData 		= "The data received from the server was invalid. Please try again."
}
