//
//  HomeViewController.swift
//  CurrencyConverter
//
//  Created by Владислав Банков on 18.02.2021.
//

import UIKit

protocol IHomeViewController: UIViewController {
	var tapButtonHandler: ((_ side: ButtonSide) -> Void)? { get set }

	func setFields(leftHandSideFieldValue: String?, rightHandSideFieldValue: String?)
	func setLabels(leftHandSideLabelValue: String?, rightHandSideLabelValue: String?)
	func getFields() -> (String, String)
	func getLabels() -> (String, String)
	func dismissSpinner()
	func throwCurrency(_ currency: Valute, button: ButtonSide)
}

final class HomeViewController: UIViewController {

	var tapButtonHandler: ((_ side: ButtonSide) -> Void)?
	
	private let presenter: IHomePresenter
	private let homeView = HomeView()
	
	init(with presenter: IHomePresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
		title = StringConstants.currencyConverterTitle.rawValue
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = homeView
		homeView.delegate = self
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.viewDidLoad(with: self)
	}
}

extension HomeViewController: IHomeViewController {
	func getLabels() -> (String, String) {
		let labels = homeView.getLabels()
		// this condition gonna be ok always
		guard let label1 = labels.0, let label2 = labels.1 else { return ("", "") }
		return (label1, label2)
	}


	func getFields() -> (String, String) {
		let fields = homeView.getFields()
		// we always have character in the text field even if it's empty, so below condition gonna be ok always
		guard let field1 = fields.0, let field2 = fields.1 else { return ("", "") }
		return (field1, field2)
	}

	func throwCurrency(_ currency: Valute, button: ButtonSide) {
		button == .left ? homeView.setLabels(leftHandSideLabelValue: currency.charCode, rightHandSideLabelValue: nil)
			: homeView.setLabels(leftHandSideLabelValue: nil, rightHandSideLabelValue: currency.charCode)
		presenter.valuteDidChange()
	}
	
	func setFields(leftHandSideFieldValue: String?, rightHandSideFieldValue: String?) {
		homeView.setFields(leftHandSideFieldValue: leftHandSideFieldValue, rightHandSideFieldValue: rightHandSideFieldValue)
	}

	func setLabels(leftHandSideLabelValue: String?, rightHandSideLabelValue: String?) {
		homeView.setLabels(leftHandSideLabelValue: leftHandSideLabelValue, rightHandSideLabelValue: rightHandSideLabelValue)
	}

	func dismissSpinner() {
		homeView.dismissSpinner()
	}
}

enum ButtonSide { case right, left }
