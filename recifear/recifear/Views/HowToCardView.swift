//
//  HowToCardView.swift
//  recifear
//
//  Created by Danielly Santos Lopes da Silva on 31/03/23.
//

import SwiftUI


struct HowToCardView: View {
    let howToCardImage: String
    let howToRetanguloImage: String
    let howToTitle: String
    
    
    var body: some View {
        
        
        
        VStack(alignment: .leading, spacing: 0) {
            
            Image(howToCardImage)
                .resizable()
                .frame(width: 343, height: 168)
            
            ZStack {
                Image(howToRetanguloImage).resizable().frame(width: 343, height: 72)
                
                Text(howToTitle)
                    .frame(maxWidth:333, alignment: .leading)
                //                    .padding(.leading, 24)
                //                        .padding(.top, 160)
            }
            
            
            
        }
    }
    
    
}



struct HowToCardView_Previews: PreviewProvider {
    static var previews: some View {
        HowToCardView(howToCardImage: "experiencias", howToRetanguloImage: "testeee", howToTitle: "testee")
    }
}


        
