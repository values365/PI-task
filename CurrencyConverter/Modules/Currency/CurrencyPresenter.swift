//
//  CurrencyPresenter.swift
//  CurrencyConverter
//
//  Created by Владислав Банков on 19.02.2021.
//

import Foundation

protocol ICurrencyPresenter {
	var currencies: [String: Valute] { get }
	var selectedValute: Valute? { get }
	func viewDidLoad(with viewController: ICurrencyViewController)
	func rowDidSelect(with index: Int)
}

final class CurrencyPresenter {

	var currencies: [String: Valute] = [:]
	var selectedValute: Valute?

	private weak var viewController: ICurrencyViewController?

	init(with currencies: [String: Valute]) {
		self.currencies = currencies
	}
}

extension CurrencyPresenter: ICurrencyPresenter {
	func rowDidSelect(with index: Int) {
		selectedValute = Array(currencies.values)[index]
	}

	func viewDidLoad(with viewController: ICurrencyViewController) {
		self.viewController = viewController
	}
}
