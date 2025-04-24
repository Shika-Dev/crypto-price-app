//
//  ListCoinResponse.swift
//  crypto-price-app
//
//  Created by Parama Artha on 22/04/25.
//

struct CoinResponse : Codable {
    let data: [DataElement]
    let info: Info
}

struct DataElement: Codable {
    let id, symbol, name, nameid: String
    let rank: Int
    let priceUsd, percentChange24H, percentChange1H, percentChange7D: String?
    let priceBtc, marketCapUsd: String?
    let volume24, volume24A: Double?
    let csupply, tsupply, msupply: String?
}

struct Info: Codable {
    let coinsNum, time: Int?
}
