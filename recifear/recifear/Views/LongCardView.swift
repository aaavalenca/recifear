//
//  LongCardView.swift
//  recifear
//
//  Created by Danielly Santos Lopes da Silva on 31/03/23.
//

import SwiftUI

struct LongCardView: View {
    
    let longCardImage: String
     let longTitle: String
     let longSubtitle: String
    
    var body: some View {
        ZStack(alignment: .leading ) {
                  Image(longCardImage)
                      .resizable()
                      .frame(width: 737, height: 246)
      
                  VStack(alignment: .leading){
                      Text(longTitle)
                      Text(longSubtitle)
                  }.padding(.leading, 24)
                      .padding(.top, 160)
      
              }.padding(.top, 20)
                  .background(Color.orange)
    }
}

struct LongCardView_Previews: PreviewProvider {
    static var previews: some View {
        LongCardView(longCardImage: "experiencias", longTitle: "teste", longSubtitle: "textinho")
    }
}


