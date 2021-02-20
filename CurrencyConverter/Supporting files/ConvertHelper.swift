//
//  ConvertHelper.swift
//  CurrencyConverter
//
//  Created by Владислав Банков on 19.02.2021.
//

import Foundation

final class ConvertHelper {

	private var model: JSONModel

	init(model: JSONModel) {
		self.model = model
	}

	func getActualValue(forKey key: String) -> String? {
		guard let currency = model.valute[key] else { return nil }
		let floatValue = currency.value / Float(currency.nominal)
		return String(format: "%.2f", floatValue)
	}
}
