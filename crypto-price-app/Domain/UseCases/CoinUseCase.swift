//
//  CoinUseCase.swift
//  crypto-price-app
//
//  Created by Parama Artha on 22/04/25.
//

protocol CoinUseCase {
    func fetchCoins(completion: @escaping(Result<CoinEntity, Error>) -> Void)
}
