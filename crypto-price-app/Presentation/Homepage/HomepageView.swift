//
//  ContentView.swift
//  crypto-price-app
//
//  Created by Parama Artha on 22/04/25.
//

import SwiftUI

struct HomepageView: View {
    @ObservedObject var viewModel: HomepageViewModel
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 1) {
                    Text("Measures In 24h")
                        .font(.body)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.bottom, 20)
                    ForEach(Array(viewModel.coins.enumerated()), id: \.element.id) { index, coin in
                        CoinRowView(
                            symbol: coin.symbol,
                            name: coin.name,
                            price: coin.priceUsd,
                            percentChange: coin.percentChange24h,
                            isFirst: index == 0,
                            isLast: index == viewModel.coins.count - 1
                        )
                    }
                    
                    Text("Last Update: \(Date(timeIntervalSince1970: TimeInterval(viewModel.lastUpdate)).formatted())")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                }
            }
            .padding()
            .background(.gray.opacity(0.2))
            .navigationTitle("Crypto Prices")
            .refreshable {
                viewModel.loadCoins()
            }
            .onAppear {
                viewModel.loadCoins()
            }
        }
    }
}

#Preview {
    let mockViewModel = HomepageViewModel(usecase: MockCoinUseCase())
    return HomepageView(viewModel: mockViewModel)
}

// Mock UseCase untuk Preview
class MockCoinUseCase: CoinUseCase {
    func fetchCoins(completion: @escaping (Result<CoinEntity, Error>) -> Void) {
        let mockCoins = [
            Coin(id: "1", symbol: "BTC", name: "Bitcoin", nameid: "bitcoin", rank: 1, priceUsd: "50000", percentChange24h: "1"),
            Coin(id: "2", symbol: "ETH", name: "Ethereum", nameid: "ethereum", rank: 2, priceUsd: "3000", percentChange24h: "1"),
            Coin(id: "3", symbol: "BNB", name: "Binance Coin", nameid: "binance-coin", rank: 3, priceUsd: "400", percentChange24h: "1"),
        ]
        completion(.success(CoinEntity(coinList: mockCoins, lastUpdate: 1745304364)))
    }
}

struct CoinRowView: View {
    let symbol: String
    let name: String
    let price: String
    let percentChange: String
    let isFirst: Bool
    let isLast: Bool
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://assets.coincap.io/assets/icons/\(symbol.lowercased())@2x.png")) { image in
                image
                    .resizable()
                    .frame(width: 32, height: 32)
            } placeholder: {
                Image(systemName: "dollarsign.circle")
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            
            Text(name)
                .font(.headline)
            Spacer()
            Text("$\(price)")
                .font(.subheadline)
            Spacer().frame(width: 10)
            if percentChange.contains("-") {
                Image(systemName: "arrow.down")
                    .foregroundStyle(Color.red)
                    .offset(x: 6)
            } else {
                Image(systemName: "arrow.up")
                    .foregroundStyle(Color.green)
                    .offset(x: 6)
            }
            Text("\(percentChange.replacingOccurrences(of: "-", with: ""))%")
                .foregroundStyle(percentChange.contains("-") ? Color.red : Color.green)
        }
        .padding()
        .background(.white)
        .cornerRadius(isFirst || isLast ? 12 : 0, corners: isFirst ? [.topLeft, .topRight] : isLast ? [.bottomLeft, .bottomRight] : [])
    }
}
