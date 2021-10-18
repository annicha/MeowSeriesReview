//
//  MSRButton.swift
//  MeowSeriesReview
//
//  Created by Anne on 18/10/21.
//

import UIKit

class MSRButton: UIButton {
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	// this one gets called via storyboard, which we don't use it
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	/// init with a custom background color, can be anything but white
	init(backgroundColor: UIColor, title: String){
		super.init(frame: .zero) // because auto constraints will handle this later with auto layout
		self.backgroundColor = backgroundColor
		self.setTitle(title, for: .normal)
		configure()
	}
	
	private func configure(){
		layer.cornerRadius 			= 10
		setTitleColor(.white, for: .normal) 
		titleLabel?.font 			= UIFont.preferredFont(forTextStyle: .headline)
		// This means USE auto-layout
		translatesAutoresizingMaskIntoConstraints = false
	}
	
}
