//
//  HomepageViewModel.swift
//  crypto-price-app
//
//  Created by Parama Artha on 22/04/25.
//

import Foundation

class HomepageViewModel: ObservableObject {
    @Published var coins: [Coin] = []
    @Published var lastUpdate: Int = 0
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let usecase: CoinUseCase
    
    init(usecase: CoinUseCase){
        self.usecase = usecase
    }
    
    func loadCoins() {
        print("🔄 Load the coins...")
        isLoading = true
        usecase.fetchCoins { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let entity):
                    print("✅ Get \(entity.coinList.count) coins successfully")
                    self?.coins = entity.coinList
                    self?.lastUpdate = entity.lastUpdate
                case .failure(let error):
                    print("❌ Error: \(error.localizedDescription)")
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
