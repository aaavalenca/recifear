//
//  AboutUsView.swift
//  recifear
//
//  Created by sofia.ribeiro on 05/04/23.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
                NavigationStack {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            
                        
                            
                            Text("Sobre nós").font(.custom("ObviouslyVar-WideSmBd", size: 40)).foregroundColor(Color("primary"))

                            Text("O RecifeAR foi idealizado como uma ferramenta que pudesse ser utilizada em diversos contextos, para quem quisesse ensinar e discutir sobre temas de Justiça Social").font(.custom("ObviouslyVar-Reg", size: 20)).foregroundColor(Color("primary"))
                            
                            Text("Nosso objetivo não é trazer temas obrigatórios ou um guia de como e quando utilizar cada experiência e sim instigar você a utilizar o que trazemos aqui em seu contexto, seja em uma oficina, em um evento, em uma sala de aula ou afins.").font(.custom("ObviouslyVar-Reg", size: 20)).foregroundColor(Color("black"))
                            
                            Group {
                                Image("montandorecife")
                                    .resizable()
                                    .frame(height: 209)
                                    .scaledToFill()
                        
                                
                                Text("O que trazemos aqui, então, são algumas sugestões de tópicos que podem ser usados em cada experiência:").font(.custom("ObviouslyVar-Reg", size: 20)).foregroundColor(Color("black"))
                                
                                Text("Montando o Recife").font(.custom("ObviouslyVar-WideSmBd", size: 20)).foregroundColor(Color("black"))

                            }

                            
                            Group {
                                
                                Text("Pode ser usada para abordar temas como organização arquitetônica e urbana da cidade; diferentes tipos de construções e suas particularidades; vivências relacionadas a cada tipo de habitação; entre outras.").font(.custom("ObviouslyVar-Reg", size: 20)).foregroundColor(Color("black"))
                            }
                            
                            
                            Group {
                                Text("Mude o clima").font(.custom("ObviouslyVar-WideSmBd", size: 20)).foregroundColor(Color("black"))
      
                            }
                            
                            Group {
                                Text("Busca explorar a influência da quantidade e tipo de habitações na sensação térmica da cidade. Pode despertar discussões sobre como o clima afeta a vida de quem mora em determinadas construções.").font(.custom("ObviouslyVar-Reg", size: 20)).foregroundColor(Color("black"))
      
                            }
                            

                        }.padding(.leading, 60)
                            .padding(.trailing, 60)
                    }
                }
            }
    }


struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}