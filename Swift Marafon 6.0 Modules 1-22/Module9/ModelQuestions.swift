//
//  ModelQuestions.swift
//  Swift Marafon 6.0 Modules 1-22
//
//  Created by Djinsolobzik on 31.01.2023.
//

import Foundation


struct Questions {
    var question: String
}

#if DEBUG
extension Questions {
    static let sampleData = [
        Questions(question: "ggdsfgdsf"),
        Questions(question: "dssvsdv"),
        Questions(question: "fvdfbdsbdfsbdfsbdfsbdfbdfbdfb")
    ]
}
#endif
