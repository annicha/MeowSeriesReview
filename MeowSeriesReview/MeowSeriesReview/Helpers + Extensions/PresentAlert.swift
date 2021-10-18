//
//  PresentAlert.swift
//  MeowSeriesReview
//
//  Created by Anne on 18/10/21.
//

import UIKit

extension UIViewController {
	
	/// completion is passed back only if user press ok
	func presentMSRFAlert(title: String,
									message: String,
									okButtonTitle: String? = nil,
									_ completion: ( () -> Void)? = nil) {
		DispatchQueue.main.async {
			let alertVC = GFAlertVC(title: title,
									message: message,
									okButtonTitle: okButtonTitle,
									showCancelButton: okButtonTitle != nil,
									completion)
			alertVC.modalPresentationStyle  = .overFullScreen // prevent card view
			alertVC.modalTransitionStyle    = .crossDissolve // fade in style
			self.present(alertVC, animated: true)
		}
	}

}

