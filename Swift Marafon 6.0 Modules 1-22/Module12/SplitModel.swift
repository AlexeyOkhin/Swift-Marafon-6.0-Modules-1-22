//
//  SplitModel.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 15.02.2023.
//

import Foundation


struct SplitModel {
    var total: String
    var percent: Float
    var numSplit: Float

    func resultSplit() -> Float {
        let result = ((Float(total) ?? 0.0) + ((Float(total) ?? 0.0) * percent)) / numSplit
        return result
    }
}
