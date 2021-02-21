//
//  Assembly.swift
//  CurrencyConverter
//
//  Created by Владислав Банков on 18.02.2021.
//

import UIKit

enum Assembly {
	static func initModule() -> HomeViewController {
		return HomeViewController(with: HomePresenter())
	}

	static func initCurrencyModule(with presenter: CurrencyPresenter) -> CurrencyViewController {
		return CurrencyViewController(with: presenter)
	}
}
