//
//  CardViewArrayModel.swift
//  recifear
//
//  Created by Danielly Santos Lopes da Silva on 31/03/23.
//

import Foundation

class CardViewArrayModel: ObservableObject {
    
    @Published var cardInfos = [CardInfos]()
    
    init() {
        cardInfos = [CardInfos(id: UUID(), image: "experiencias", text: "vai pegar"),
                     CardInfos(id: UUID(), image: "comousar", text: "pegouu")]
        
    }
}

