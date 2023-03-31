//
//  MenuView.swift
//  recifear
//
//  Created by sofia.ribeiro on 28/03/23.
//

//MUDANCAAAA

import SwiftUI

struct MenuView: View {
    
    @State var selectedCard : String = "experiencias"
    
    
    @StateObject var viewModel = CardViewArrayModel()
    
    var body: some View {
        NavigationStack {
            HStack{
                VStack{
                    ForEach(viewModel.cardInfos, id: \.id) { cardInfo in
                        CardView(cardImage: cardInfo.image, cardText: cardInfo.text)
                            .onTapGesture {
                                selectedCard = cardInfo.text
                            }
                        
                    }.listStyle(SidebarListStyle())
                }.frame(maxWidth: 306)
                
                ZStack{
                    Color(red: 255/255, green: 250/255, blue: 248/255).ignoresSafeArea()
                    
                    if selectedCard == "experiencias"{
                        ExperienceView()
                    } else{
                        HowToUseView()
                    }
                    
                }
            }
        }
    }
}


struct ExperienceView : View {
    
    @State var longModel = LongCardViewArrayModel()
    
    @State var showBuildingRecife = false
    
    var body : some View {
        
       
        VStack(alignment: .leading) {
            Text("Experiências")
                .font(.system(size: 40))
                .padding(.top, 60)
                .background(Color.pink)
                .padding(.bottom, 30)
                .background(Color.cyan)
            
            NavigationStack {
                VStack {
                    NavigationLink(destination: DescriptionView()) {
                            ForEach(longModel.longCardInfos, id: \.id) { longCardInfo in
                                LongCardView(longCardImage: longCardInfo.image, longTitle: longCardInfo.title, longSubtitle: longCardInfo.subtitle)
                            }
                        }
                    
                    
                    NavigationLink(destination: HowToUseView()) {
                        ForEach(longModel.longCardInfos, id: \.id) { longCardInfo in
                            LongCardView(longCardImage: longCardInfo.image, longTitle: longCardInfo.subtitle, longSubtitle: longCardInfo.subtitle)
                        }
                        
                    }
                }
            }.navigationTitle(showBuildingRecife ? "Voltar ao menu" : "")
        }
        }
    
}


struct HowToUseView : View {
    
    let howToCardInfos = [
        ["montandorecife", "retangulo", "Primeiros Passos"],
        ["montandorecife",  "retangulo", "As experiências"],
        ["montandorecife",  "retangulo", "Realidade aumentada"],
        ["montandorecife",  "retangulo", "Sobre nós"]]
    
    
    
    
    var body : some View {
        
        
        VStack(alignment: .leading) {
            
            Text("Como usar o app")  .font(.system(size: 40))
            Text("Boas vindas ao RecifeAR, uma ferramenta que mistura atividades manuais com realidade aumentada para representar cidades")  .font(.system(size: 20))
            
            
            
            HStack {
                HowToCardView(howToCardImage: howToCardInfos[0][0], howToRetanguloImage: howToCardInfos[0][1], howToTitle: howToCardInfos[0][2])
                HowToCardView(howToCardImage: howToCardInfos[1][0], howToRetanguloImage: howToCardInfos[1][1], howToTitle: howToCardInfos[1][2])
            }
            
            HStack {
                HowToCardView(howToCardImage: howToCardInfos[2][0], howToRetanguloImage: howToCardInfos[2][1], howToTitle: howToCardInfos[2][2])
                HowToCardView(howToCardImage: howToCardInfos[3][0], howToRetanguloImage: howToCardInfos[3][1], howToTitle: howToCardInfos[3][2])
            }
            
        }
        
    }
}

struct DescriptionView : View {
    
    @State var showExperience = false
    
    var body: some View {
        NavigationStack {
            HStack{
                
                VStack{
                    Text("Montando o Recife")
                    
                    Text("Boas vindas ao RecifeAR, uma ferramenta que mistura atividades manuais com realidade aumentada para representar cidades")
                    
                    NavigationLink(destination: Text("oi"), isActive: $showExperience){
                        Button("Começar Experiência"){
                            self.showExperience = true
                        }
                    }
                    .navigationTitle(showExperience ? "Voltar à descrição" : "")
                }
                
                Image("experienciarecife")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(width: 677, height: 720)
                    .scaledToFill()
            }
        }
    }
}



struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        HowToUseView()
    }
}

