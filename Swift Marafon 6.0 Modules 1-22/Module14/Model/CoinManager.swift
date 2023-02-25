//
//  CoinManager.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 24.02.2023.
//

import Foundation

protocol CoinServiceDelegate: AnyObject {
    func didFetchCurse(_ coinService: CoinManager, _ coin: CoinModel)
}

struct CoinManager {

    weak var delegate: CoinServiceDelegate?

    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "99DAC5FB-0B79-41C2-9981-E2A2D71CF980"

    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func fetchCurse(type: String) {
        let url = "\(baseURL)/\(type)?apikey=\(apiKey)"
        performRequest(with: url)

    }


    private func performRequest(with urlString: String) {
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let coin = self.parseJSON(data) {
                    DispatchQueue.main.async {
                        self.delegate?.didFetchCurse(self, coin)
                    }
                }
            }
        }.resume()

    }

    private func parseJSON(_ coin: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        let decodeData = try! decoder.decode(CoinModel.self, from: coin)

        let base = decodeData.asset_id_base
        let quote = decodeData.asset_id_quote
        let rate = decodeData.rate

        let coin = CoinModel(asset_id_base: base, asset_id_quote: quote, rate: rate)
        return coin
    }

}
