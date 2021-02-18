//
//  HomeView.swift
//  CurrencyConverter
//
//  Created by Владислав Банков on 18.02.2021.
//

import UIKit

final class HomeView: UIView {
	
	// MARK: - UI Components
	
	private let leftHandValueTextField = UITextField()
	private let rightHandValueTextField = UITextField()
	private let arrowView = UIImageView()
	private let leftHandCurrencyLabel = UILabel()
	private let rightHandCurrencyLabel = UILabel()
	private let leftHandCurrencyButton = UIButton()
	private let rightHandCurrencyButton = UIButton()
	
	// MARK: - Init
	
	init() {
		super.init(frame: .zero)
		
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
		addGestureRecognizer(tap)
		setupAppearance()
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

// MARK: - Internal Methods

private extension HomeView {
	@objc func dismissKeyboard() {
		endEditing(true)
	}
}

// MARK: - Appearance

private extension HomeView {
	func setupAppearance() {
		backgroundColor = .systemBackground
		setupFieldsAppearance()
		setupLabelsAppearance()
		setupButtonsAppearance()
	}
	
	func setupFieldsAppearance() {
		leftHandValueTextField.text = "120.5"
		leftHandValueTextField.font = .boldSystemFont(ofSize: Constants.commonFontSize.rawValue)
		leftHandValueTextField.textAlignment = .center
		
		rightHandValueTextField.text = "2.2"
		rightHandValueTextField.font = .boldSystemFont(ofSize: Constants.commonFontSize.rawValue)
		rightHandValueTextField.textAlignment = .center
	}
	
	func setupLabelsAppearance() {
		arrowView.image = UIImage(named: "grayArrow")
		
		leftHandCurrencyLabel.text = "RU"
		leftHandCurrencyLabel.font = .boldSystemFont(ofSize: Constants.commonFontSize.rawValue)
		leftHandCurrencyLabel.textAlignment = .center
		
		rightHandCurrencyLabel.text = "USD"
		rightHandCurrencyLabel.font = .boldSystemFont(ofSize: Constants.commonFontSize.rawValue)
		rightHandCurrencyLabel.textAlignment = .center
	}
	
	func setupButtonsAppearance() {
		leftHandCurrencyButton.setTitle(StringConstants.buttonText.rawValue, for: UIControl.State.normal)
		leftHandCurrencyButton.titleLabel?.font = .systemFont(ofSize: Constants.buttonFontSize.rawValue)
		leftHandCurrencyButton.setTitleColor(.systemTeal, for: UIControl.State.normal)
		leftHandCurrencyButton.titleLabel?.textAlignment = .center
		leftHandCurrencyButton.titleLabel?.numberOfLines = 2
		
		rightHandCurrencyButton.setTitle(StringConstants.buttonText.rawValue, for: UIControl.State.normal)
		rightHandCurrencyButton.titleLabel?.font = .systemFont(ofSize: Constants.buttonFontSize.rawValue)
		rightHandCurrencyButton.setTitleColor(.systemTeal, for: UIControl.State.normal)
		rightHandCurrencyButton.titleLabel?.textAlignment = .center
		rightHandCurrencyButton.titleLabel?.numberOfLines = 2
	}
}

// MARK: - Layout

private extension HomeView {
	func setupLayout() {
		setupFieldsLayout()
		setupLabelsLayout()
		setupButtonsLayout()
	}
	
	func setupFieldsLayout() {
		addSubview(leftHandValueTextField)
		addSubview(rightHandValueTextField)
		leftHandValueTextField.translatesAutoresizingMaskIntoConstraints = false
		rightHandValueTextField.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			leftHandValueTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.defaultSpacing.rawValue),
			leftHandValueTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.regularSpacing.rawValue),
			leftHandValueTextField.widthAnchor.constraint(equalToConstant: Constants.fieldsWidth.rawValue),
			rightHandValueTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.defaultSpacing.rawValue),
			rightHandValueTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.regularSpacing.rawValue),
			rightHandValueTextField.widthAnchor.constraint(equalToConstant: Constants.fieldsWidth.rawValue),
		])
	}
	func setupLabelsLayout() {
		addSubview(arrowView)
		addSubview(leftHandCurrencyLabel)
		addSubview(rightHandCurrencyLabel)
		arrowView.translatesAutoresizingMaskIntoConstraints = false
		leftHandCurrencyLabel.translatesAutoresizingMaskIntoConstraints = false
		rightHandCurrencyLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			arrowView.topAnchor.constraint(equalTo: rightHandValueTextField.bottomAnchor, constant: Constants.appleSpacing.rawValue / 2),
			arrowView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
			arrowView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: Constants.widthMultiplier.rawValue),
			arrowView.heightAnchor.constraint(equalToConstant: Constants.arrowHeight.rawValue),
			leftHandCurrencyLabel.topAnchor.constraint(equalTo: arrowView.bottomAnchor, constant: Constants.appleSpacing.rawValue / 2),
			leftHandCurrencyLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.regularSpacing.rawValue),
			leftHandCurrencyLabel.widthAnchor.constraint(equalToConstant: Constants.fieldsWidth.rawValue),
			rightHandCurrencyLabel.topAnchor.constraint(equalTo: arrowView.bottomAnchor, constant: Constants.appleSpacing.rawValue / 2),
			rightHandCurrencyLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.regularSpacing.rawValue),
			rightHandCurrencyLabel.widthAnchor.constraint(equalToConstant: Constants.fieldsWidth.rawValue)
		])
		
	}
	
	func setupButtonsLayout() {
		addSubview(leftHandCurrencyButton)
		addSubview(rightHandCurrencyButton)
		leftHandCurrencyButton.translatesAutoresizingMaskIntoConstraints = false
		rightHandCurrencyButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			leftHandCurrencyButton.topAnchor.constraint(equalTo: leftHandCurrencyLabel.bottomAnchor, constant: Constants.regularSpacing.rawValue),
			leftHandCurrencyButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.regularSpacing.rawValue),
			leftHandCurrencyButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: Constants.widthMultiplier.rawValue),
			rightHandCurrencyButton.topAnchor.constraint(equalTo: leftHandCurrencyLabel.bottomAnchor, constant: Constants.regularSpacing.rawValue),
			rightHandCurrencyButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Constants.regularSpacing.rawValue),
			rightHandCurrencyButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: Constants.widthMultiplier.rawValue)
		])
	}
}

