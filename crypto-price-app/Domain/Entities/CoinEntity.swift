//
//  CoinEntity.swift
//  crypto-price-app
//
//  Created by Parama Artha on 22/04/25.
//

struct CoinEntity: Codable {
    let coinList: [Coin]
    let lastUpdate: Int
}

struct Coin: Identifiable, Codable {
    let id, symbol, name, nameid: String
    let rank: Int
    let priceUsd: String
    let percentChange24h: String
}

