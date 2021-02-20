//
//  HomePresenter.swift
//  CurrencyConverter
//
//  Created by Владислав Банков on 18.02.2021.
//

import UIKit

protocol IHomePresenter {
	func viewDidLoad(with viewController: IHomeViewController)
	func valuteDidChange()
}

final class HomePresenter {
	
	private weak var viewController: IHomeViewController?
	private var jsonModel: JSONModel?
	private var convertHelper: ConvertHelper?
	private var url: URL? { URL(string: "https://www.cbr-xml-daily.ru/daily_json.js") }
	private let httpManager = HTTPManager()
}

extension HomePresenter: IHomePresenter {
	func valuteDidChange() {
		// let values = convertHelper.startCalculating(leftHandSideCurrencyKey: , rightHandSideCurrencyKey: )
	}

	func viewDidLoad(with viewController: IHomeViewController) {
		self.viewController = viewController
		loadData()
		viewController.tapButtonHandler = { [weak self] side in
			guard let self = self else { return assertionFailure("IHomeViewController self link is nil") }
			// using force-unwrap because we can't tap the button while the json model is downloaded (because of the spinner)
			let currencyViewController = Assembly.initCurrencyModule(with: self.jsonModel!)
			currencyViewController.delegate = viewController
			currencyViewController.setSide(side)
			let navigationController = UINavigationController(rootViewController: currencyViewController)
			viewController.present(navigationController, animated: true)
		}
	}
}

private extension HomePresenter {
	func loadData() {
		guard let url = url else { return assertionFailure() }
		httpManager.makeGetRequest(to: url) { [weak self] data, error in
			guard let self = self else { return assertionFailure("HomePresenter self link is nil") }
			guard let data = data else { return assertionFailure("couldn't get request data from the server") }
			let decoder = JSONDecoder()
			guard let model = try? decoder.decode(JSONModel.self, from: data) else { return assertionFailure("cannot cast json data into JSONModel struct") }
			self.viewController?.dismissSpinner()
			self.jsonModel = model
			self.initHelper()
		}
	}

	func initHelper() {
		guard let model = jsonModel else { return assertionFailure("jsonModel is nil") }
		convertHelper = ConvertHelper(model: model)
		// using force-unwrap in order to make the code simple to read, because our model is ok surely at this step so convertHelper object can't be nil
		guard let value = convertHelper!.getActualValue(forKey: "USD") else { return assertionFailure("couldn't find the value using key in the model") }
		viewController?.setFields(leftHandSideFieldValue: value, rightHandSideFieldValue: "1")
		viewController?.setLabels(leftHandSideLabelValue: "RU", rightHandSideLabelValue: "USD")

	}
}
