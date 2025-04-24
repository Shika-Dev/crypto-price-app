//
//  Mapper.swift
//  crypto-price-app
//
//  Created by Parama Artha on 22/04/25.
//

class Mapper {
    static func coin(from response: CoinResponse) -> CoinEntity {
        print("🔄 Memulai mapping data dari response ke entity")
        var result = [] as [Coin]
        for e in response.data {
            let coin = Coin(id: e.id, symbol: e.symbol, name: e.name, nameid: e.nameid, rank: e.rank, priceUsd: e.priceUsd ?? "", percentChange24h: e.percentChange24H ?? "")
            result.append(coin)
            print("✅ Mapped coin: \(coin.name) - $\(coin.priceUsd)")
        }
        print("✅ Selesai mapping \(result.count) coins")
        return CoinEntity(coinList: result, lastUpdate: response.info.time ?? 0)
    }
}
