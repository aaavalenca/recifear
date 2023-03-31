//
//  LongCardViewArrayModel.swift
//  recifear
//
//  Created by Danielly Santos Lopes da Silva on 31/03/23.
//

import Foundation

class LongCardViewArrayModel: ObservableObject {
    
    @Published var longCardInfos = [LongCardInfos]()
    
    init() {
        longCardInfos =
        [LongCardInfos(id: UUID(),
        image: "experiencias",
        title: "teste",
        subtitle: "testando"),
         
        LongCardInfos(id: UUID(),
        image: "comousar",
        title: "teste",
        subtitle: "sorte")]
    }
}
