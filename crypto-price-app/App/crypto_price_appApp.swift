//
//  crypto_price_appApp.swift
//  crypto-price-app
//
//  Created by Parama Artha on 22/04/25.
//

import SwiftUI

@main
struct crypto_price_appApp: App {
    var body: some Scene {
        WindowGroup {
            let apiService = ApiService()
            let repository = CoinRepositoryImpl(apiService: apiService)
            let useCase = CoinUseCaseAdapter(repository: repository)
            let homepageViewModel = HomepageViewModel(usecase: useCase)
            HomepageView(viewModel: homepageViewModel)
        }
    }
}
