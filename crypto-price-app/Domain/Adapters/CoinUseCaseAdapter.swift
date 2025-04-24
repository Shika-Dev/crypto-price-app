//
//  CoinUseCaseAdapter.swift
//  crypto-price-app
//
//  Created by Parama Artha on 22/04/25.
//

class CoinUseCaseAdapter: CoinUseCase {
    private let repository : CoinRepository
    
    init(repository: CoinRepository) {
        self.repository = repository
    }
    
    func fetchCoins(completion: @escaping (Result<CoinEntity, any Error>) -> Void) {
        repository.fetchCoins(completion: completion)
    }
}
