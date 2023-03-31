//
//  CarView.swift
//  recifear
//
//  Created by Danielly Santos Lopes da Silva on 31/03/23.
//

import SwiftUI

struct CardView: View {
    
    let cardImage: String
    let cardText: String
   
    
    var body: some View {
        VStack(alignment: .leading){
            Image(cardImage)
                .resizable()
                .frame(width: 258, height: 142)
            
            Text(cardText)
        }
    }
    
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardImage: "experiencias", cardText: "oi")

    }
}

