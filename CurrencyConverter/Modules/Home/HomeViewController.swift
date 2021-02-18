//
//  HomeViewController.swift
//  CurrencyConverter
//
//  Created by Владислав Банков on 18.02.2021.
//

import UIKit

protocol IHomeViewController: AnyObject {
	
}

final class HomeViewController: UIViewController {
	
	private let presenter: IHomePresenter
	private let homeView = HomeView()
	
	init(with presenter: IHomePresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
		title = "Currency Converter"
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = homeView
	}
	
	override func viewDidLoad() {
		presenter.viewDidLoad(with: self)
	}
	
}

extension HomeViewController: IHomeViewController {
	
}
