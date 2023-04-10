//
//  ARViewModel.swift
//  recifear
//
//  Created by aaav on 22/03/23.
//

import Foundation
import RealityKit
import ARKit

// É O VIEW MODEL. ELE CONTROLA O MODEL
class ARViewModel: UIViewController, ObservableObject, ARSessionDelegate {

    // INSTANCIA O MODEL
    @Published private var model : ARModel = ARModel()

    // A VIEW DO MODEL, ONDE AS COISAS DE FATO DE DESENHAM E A GENTE VÊ
    var arView : ARView {
        model.arView
    }

    // DÁ AO VIEWMODEL O CONTROLE DA VIEW
    func startSessionDelegate() {
        model.arView.session.delegate = self
    }

    // GERENCIA A SESSÃO. AVISA QUANDO NOVAS ÂNCORAS FORAM ADICIONADAS À CENA E RODA O MÉTODO QUE VAI VINCULAR CADA IMAGEM A UMA ÂNCORA E DEPOIS BOTAR OS 3D EM CIMA
    func session (_ session : ARSession, didAdd anchors: [ARAnchor]){
        model.imageRecognized(anchors: anchors)
    }
    
    func resetSession(){
        model.resetSession()
    }

}
