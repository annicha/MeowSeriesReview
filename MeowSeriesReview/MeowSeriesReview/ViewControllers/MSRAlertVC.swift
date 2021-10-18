//
//  MSRAlertView.swift
//  MeowSeriesReview
//
//  Created by Anne on 18/10/21.
//

import UIKit

class MSRAlertVC: UIViewController {
	
	let containerView   = UIView()
	let titleLabel      = MSRTitleLabel(textAlignment: .center, fontSize: 20)
	let messageLabel    = MSRBodyLabel(textAlignment: .center)
	let actionButton    = MSRButton(backgroundColor: .systemGreen, title: "OK")
	let cancelButton    = MSRButton(backgroundColor: .secondaryLabel, title: NSLocalizedString("Cancel", comment: ""))
	
	var alertTitle: String?
	var okButtonTitle: String?
	var message: String?
	
	let padding: CGFloat = 20
	var showCancel: Bool = false
	var completion: (() -> Void)?
	
	
	init(title: String, message: String, okButtonTitle: String?, showCancelButton: Bool = false, _ completion: (() -> Void)? = nil) {
		super.init(nibName: nil, bundle: nil)
		self.alertTitle     = title
		self.message        = message
		self.okButtonTitle	= okButtonTitle
		self.showCancel		= showCancelButton
		self.completion 	= completion
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
		configureContainerView()
		configureTitleLabel()
		
		if showCancel {
			configureCancelActionButton()
			configureActionButton()
		} else {
			configureCancelActionButton("OK")
		}
		configureMessageLabel()
	}
	
	
	func configureContainerView() {
		view.addSubview(containerView)
		containerView.backgroundColor       = .systemBackground
		containerView.layer.cornerRadius    = 18
		containerView.layer.borderWidth     = 2
		containerView.layer.borderColor     = UIColor.white.cgColor
		containerView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 220)
		])
		
		
		if UIDevice.current.userInterfaceIdiom == .pad
		&& traitCollection.horizontalSizeClass != .compact {
			NSLayoutConstraint.activate([
				containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
			])
		} else {
			NSLayoutConstraint.activate([
				containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
			])
		}

	}
	
	
	func configureTitleLabel() {
		containerView.addSubview(titleLabel)
		titleLabel.text = alertTitle ?? "Something went wrong"
		
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
			titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
			titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
			titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 28)
		])
	}
	
	
	func configureCancelActionButton(_ text: String = NSLocalizedString("Cancel", comment: "")) {
		containerView.addSubview(cancelButton)
		cancelButton.setTitle(text, for: .normal)
		cancelButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
			cancelButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
			cancelButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
			cancelButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
			cancelButton.heightAnchor.constraint(equalToConstant: 44)
		])
	}
	
	func configureActionButton() {
		containerView.addSubview(actionButton)
		actionButton.setTitle(okButtonTitle ?? "OK", for: .normal)
		actionButton.addTarget(self, action: #selector(dismissWithCompletion), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
			actionButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -padding),
			actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
			actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
			actionButton.heightAnchor.constraint(equalToConstant: 44)
		])
	}
	
	
	func configureMessageLabel() {
		containerView.addSubview(messageLabel)
		messageLabel.text           = message ?? "Unable to complete request"
		messageLabel.numberOfLines  = 0
		
		NSLayoutConstraint.activate([
			messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
			messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
			messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding)
		])
		
		if showCancel {
			NSLayoutConstraint.activate([
				messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
			])
		} else {
			NSLayoutConstraint.activate([
				messageLabel.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -12)
			])
		}

	}
	
	@objc func dismissVC() {
		self.dismiss(animated: true, completion: nil)
	}
	
	@objc func dismissWithCompletion() {
		self.dismiss(animated: true, completion: completion)
	}
}
