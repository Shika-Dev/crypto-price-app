//
//  ApiService.swift
//  crypto-price-app
//
//  Created by Parama Artha on 22/04/25.
//

import Foundation

class ApiService {
    func fetchCoinList(completion: @escaping(Result<CoinResponse, Error>) -> Void) {
        let url = URL(string: "https://api.coinlore.net/api/tickers/")!
        print("🌐 Memulai request ke API: \(url)")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("❌ Tidak ada data yang diterima")
                completion(.failure(NSError(domain: "No Data", code: 0)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(CoinResponse.self, from: data)
                print("✅ Berhasil decode response dengan \(result.data.count) coins")
                completion(.success(result))
            } catch {
                print("❌ Decode error: \(error.localizedDescription)")
                completion(.failure(error))
            }
            
        }.resume()
    }
}
