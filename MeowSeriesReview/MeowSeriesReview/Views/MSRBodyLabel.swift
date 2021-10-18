//
//  MSRBodyLabel.swift
//  MeowSeriesReview
//
//  Created by Anne on 18/10/21.
//

import UIKit


class MSRBodyLabel: UILabel {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	init(textAlignment: NSTextAlignment, fontSize: CGFloat = 13) {
		super.init(frame: .zero)
		self.textAlignment = textAlignment
		self.font = UIFont.systemFont(ofSize: fontSize)
		configure()
	}
	
	
	private func configure() {
		textColor                   = .secondaryLabel
		font                        = UIFont.preferredFont(forTextStyle: .body)
		adjustsFontSizeToFitWidth   = true
		minimumScaleFactor          = 0.75
		lineBreakMode               = .byWordWrapping
		translatesAutoresizingMaskIntoConstraints = false
	}
}
