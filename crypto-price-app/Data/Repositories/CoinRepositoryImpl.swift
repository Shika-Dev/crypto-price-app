//
//  CoinRepositoryImpl.swift
//  crypto-price-app
//
//  Created by Parama Artha on 22/04/25.
//

class CoinRepositoryImpl : CoinRepository {
    private let apiService : ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    func fetchCoins(completion: @escaping (Result<CoinEntity, Error>) -> Void) {
        apiService.fetchCoinList { result in
            switch result {
            case .success(let response):
                let result = Mapper.coin(from: response)
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
