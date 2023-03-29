//
//  MenuView.swift
//  recifear
//
//  Created by sofia.ribeiro on 28/03/23.
//

import SwiftUI

struct MenuView: View {
    
    @State var selectedCard : String = "experiencias"
    
    
    let cardInfos = [["experiencias", "Experiências"], ["comousar", "Como usar o app"]]
    
    
    
    
    
    var body: some View {
        
        HStack{
                
                VStack{
                    Color.white.ignoresSafeArea()
                    ForEach(cardInfos, id: \.self) { cardInfo in
                        CardView(cardImage: cardInfo[0], cardText: cardInfo[1])
                            .onTapGesture {
                                selectedCard = cardInfo[0]
                            }
                        
                    }
                }
                .listStyle(SidebarListStyle())
            
            .frame(width: 306)
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


struct ExperienceView : View {
    
    
    let longCardInfos = [["montandorecife", "Montando Recife", "Crie o Recife dos seus sonhos"], ["comousar", "Montando Recife 2", "Crie o Recife dos seus sonhos2"]]
    
    
    
    var body : some View {
        
        
        
        VStack(alignment: .leading) {
            Text("Experiências")
                .font(.system(size: 40))
                .padding(.top, 60).background(Color.pink)
                .padding(.bottom, 30).background(Color.cyan)
           // ZStack {
            VStack {
                ForEach(longCardInfos, id: \.self) { longCardInfo in
                    LongCardView(longCardImage: longCardInfo[0], longTitle: longCardInfo[1], longSubtitle: longCardInfo[2])
                    
                }
            }//.padding(.bottom, 56).background(Color.green)

       
            
       // }//.padding(20)
    }
        
        
        
    }
}


struct HowToUseView : View {
    var body : some View {
        Rectangle().frame(width: 400).foregroundColor(.purple)
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
//
                Text(longTitle)
                Text(longSubtitle)
                   

            }.padding(.leading, 24)
                .padding(.top, 160)

            
        }.padding(.top, 20).background(Color.orange)
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
        MenuView()
    }
}
