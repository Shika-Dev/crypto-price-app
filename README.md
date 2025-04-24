# 🚀 Crypto Price App

An iOS application for monitoring cryptocurrency prices in real-time.

## ✨ Features

- 📊 Display list of cryptocurrencies with current prices
- 🔄 Pull-to-refresh to update data
- 🎨 Clean and readable interface
- 📱 Support for both iPhone and iPad

## 🛠 Technologies Used

- 🎯 SwiftUI for UI
- 🏗 MVVM Architecture
- 🧹 Clean Architecture
- 🌐 URLSession for networking
- ⚡️ Combine for reactive programming

## 📁 Project Structure

```
crypto-price-app/
├── App/
│   └── crypto_price_appApp.swift
├── Presentation/
│   └── Homepage/
│       ├── HomepageView.swift
│       └── HomepageViewModel.swift
├── Domain/
│   ├── Entities/
│   │   └── CoinEntity.swift
│   ├── UseCases/
│   │   └── CoinUseCase.swift
│   └── Adapters/
│       └── CoinUseCaseAdapter.swift
├── Data/
│   ├── Services/
│   │   └── ApiService.swift
│   ├── Repositories/
│   │   ├── CoinRepository.swift
│   │   └── CoinRepositoryImpl.swift
│   ├── Responses/
│   │   └── CoinResponse.swift
│   └── Mapper/
│       └── Mapper.swift
└── Preview Content/
    └── Preview Assets.xcassets
```

## 🚀 How to Run

1. 📥 Clone this repository
2. 💻 Open `crypto-price-app.xcodeproj` in Xcode
3. 📱 Select simulator or device target
4. ▶️ Press Run (⌘R)

## 🔌 API

This application uses the [CoinLore](https://www.coinlore.com/cryptocurrency-data-api) API to fetch cryptocurrency data.

## 📝 Logging

The application has a comprehensive logging system to help with debugging:

- 🌐 Network request logging
- ✅ Successful operation logging
- ❌ Error logging
- 🔄 Progress logging

## 🤝 Contributing

Please feel free to submit pull requests. For major changes, please open an issue first to discuss what you would like to change.

## 📄 License

[MIT](https://choosealicense.com/licenses/mit/) 