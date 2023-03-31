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
    
    let cardInfos = [
        ["experiencias", "Experiências"],
        ["comousar", "Como usar o app"]
    ]
    
    var body: some View {
        NavigationStack {
            HStack{
                VStack{
                    ForEach(cardInfos, id: \.self) { cardInfo in
                        CardView(cardImage: cardInfo[0], cardText: cardInfo[1])
                            .onTapGesture {
                                selectedCard = cardInfo[0]
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
    let longCardInfos = [
        ["montandorecife", "Montando Recife", "Crie o Recife dos seus sonhos"],
        ["comousar", "Montando Recife 2", "Crie o Recife dos seus sonhos2"]
    ]
    
    @State var showBuildingRecife = false
    
    var body : some View {
        VStack(alignment: .leading) {
            Text("Experiências")
                .font(.system(size: 40))
                .padding(.top, 60)
                .background(Color.pink)
                .padding(.bottom, 30)
                .background(Color.cyan)
            
            VStack {
                NavigationLink(destination: DescriptionView(), isActive: $showBuildingRecife) {
                    LongCardView(longCardImage: longCardInfos[0][0], longTitle: longCardInfos[0][1], longSubtitle: longCardInfos[0][2])
                }
                .navigationTitle(showBuildingRecife ? "Voltar ao menu" : "")
               
                NavigationLink(destination: HowToUseView()) {
                    LongCardView(longCardImage: longCardInfos[1][0], longTitle: longCardInfos[1][1], longSubtitle: longCardInfos[1][2])
                }
            }
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
        NavigationStack{
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






//struct SplitView: View {
//
//    @State var selected: Int? = nil
//
//    var body: some View {
//        HStack {
//            List(0...10, id: \.self, selection: $selected) { number in
//                HStack {
//                    Text("Select \(number)")
//                    Spacer()
//                }
//                .background(number == selected ? highlightColor : nil)
//                .contentShape(Rectangle())
//                .onTapGesture {
//                    selected = number
//                }
//            }
//            .frame(width: 200)
//            .listStyle(SidebarListStyle())
//
//            Spacer()
//            detailView
//            Spacer()
//        }
//
//    }
//
//    @ViewBuilder var detailView: some View {
//        if selected == nil {
//            Text("Nothing is selected")
//        } else {
//            Text("\(selected!) is selected")
//        }
//    }
//
//    var highlightColor: some View {
//        Color.accentColor
//            .opacity(0.8)
//            .cornerRadius(10)
//            .frame(height: 40)
//            .frame(minWidth: 150, maxWidth: 200)
//    }
//}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        HowToUseView()
    }
}

