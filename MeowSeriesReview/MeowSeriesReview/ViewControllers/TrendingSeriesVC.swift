//
//  TrendingSeriesVC.swift
//  MeowSeriesReview
//
//  Created by Anne on 18/10/21.
//

import UIKit

class TrendingSeriesVC: UIViewController {
	
	var page: Int = 1
	var series: [TVSeries] = []

    override func viewDidLoad() {
        super.viewDidLoad()
		setupView()
		getSeries()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(false, animated: true)
	}

	// MARK: - Methods

	func setupView(){
		view.backgroundColor = .systemBackground
		navigationController?.setNavigationBarHidden(false, animated: true)
	}
	
	
	// MARK: - Network
	func getSeries(){
		SeriesController.shared.fetchTrendingSeries(page: page) { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let series):
				self.series += series
				self.page += 1
				print(series)
			case .failure(let error):
				self.presentMSRFAlert(title: "Error",
									  message: error.localizedDescription)
			}
		}
	}
}
