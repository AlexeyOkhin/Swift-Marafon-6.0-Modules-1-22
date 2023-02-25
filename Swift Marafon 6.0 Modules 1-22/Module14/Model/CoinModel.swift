//
//  CoinModel.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 25.02.2023.
//

import Foundation

struct CoinModel: Decodable {
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
