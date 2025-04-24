//
//  CoinRepository.swift
//  crypto-price-app
//
//  Created by Parama Artha on 22/04/25.
//

protocol CoinRepository {
    func fetchCoins(completion: @escaping (Result<CoinEntity, Error>) -> Void)
}
