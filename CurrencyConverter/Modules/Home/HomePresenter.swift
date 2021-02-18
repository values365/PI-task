//
//  HomePresenter.swift
//  CurrencyConverter
//
//  Created by Владислав Банков on 18.02.2021.
//

import Foundation

protocol IHomePresenter {
	func viewDidLoad(with viewController: IHomeViewController)
}

final class HomePresenter {
	
	private weak var viewController: IHomeViewController?
	private let httpManager = HTTPManager()
	private var url: URL? { URL(string: "https://www.cbr-xml-daily.ru/daily_json.js") }
	private var jsonModel: JSONModel?
	
	init() {
		loadData()
	}
}

extension HomePresenter: IHomePresenter {
	func viewDidLoad(with viewController: IHomeViewController) {
		self.viewController = viewController
	}
}

private extension HomePresenter {
	func loadData() {
		guard let url = url else { return assertionFailure() }
		httpManager.makeGetRequest(to: url) { [weak self] data, error in
			guard let self = self else { return assertionFailure("presenter self link is nil")}
			guard let data = data else { return assertionFailure("request data from server is nil")}
			let decoder = JSONDecoder()
			guard let model = try? decoder.decode(JSONModel.self, from: data) else { return assertionFailure("cannot cast json data into JSONModel struct")}
			self.jsonModel = model
			print(self.jsonModel)
		}
	}
}
