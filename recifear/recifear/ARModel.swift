//
//  ARModel.swift
//  recifear
//
//  Created by aaav on 22/03/23.
//

import Foundation
import RealityKit
import ARKit

struct ARModel{
    private(set) var arView : ARView
    
    // INICIALIZA O MODEL, ASSIM QUE INSTANCIADO
    init() {
        arView = ARView(frame: .zero)
        
        // PEGA TODAS AS IMAGENS DAS PASTA RESOURCES QUE SERVIRÃO DE ÂNCORA
        guard let trackerImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        
        // CONFIGURA A REALITADE AUMENTADA PARA IDENTIFICAR IMAGENS 2D NO ESPAÇO
        let configuration = ARImageTrackingConfiguration()
        configuration.trackingImages = trackerImages
        configuration.maximumNumberOfTrackedImages = 20
        
        arView.session.run(configuration)
    }
    
    
    // ENCONTRA AS IMAGENS NA CÂMERA
    mutating func imageRecognized(anchors: [ARAnchor]) {
        // PEGA TODAS AS IMAGENS DA CENA E ANCORA NUM LUGAR
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        
        // PEGA AS ÂNCORAS (TIPO AS COORDENADAS)
        for anchor in anchors {
            guard let imageAnchor = anchor as? ARImageAnchor else { return }
            var modelEntity = ModelEntity()
            
            // CRIA O OBJETO 3D
            modelEntity = try! ModelEntity.loadModel(named: imageAnchor.name! + ".usdz")
            modelEntity.name = imageAnchor.name!
            
            // COLOCA O OBJETO EM CIMA DA ÂNCORA
            placeConstruction(construction: modelEntity, imageAnchor: imageAnchor)
        }
    }
    
    // COLOCA O OBJETO EM CIMA DA ÂNCORA
    func placeConstruction(construction: ModelEntity, imageAnchor: ARImageAnchor){
        
        let imageAnchorEntity = AnchorEntity(anchor: imageAnchor)
        
        // PODE MEXER NA ESCALA DO OBJETO 3D
        construction.transform.scale = SIMD3<Float>(0.00015, 0.00015, 0.00015)
        
        if construction.name == "predio"{
            construction.transform.scale = SIMD3<Float>(0.00035, 0.00035, 0.00035)
        }
        // SITUA O OBJETO 3D NO ESPAÇO EM RELAÇÃO À ÂNCORA
        construction.setPosition(SIMD3(x: 0, y: 0, z: 0), relativeTo: imageAnchorEntity)
        
        // INSTALA POSSIBILIDADE DE MUDAR O TAMANHO E ROTACIONAR
        construction.generateCollisionShapes(recursive: true)
        arView.installGestures([.scale, .rotation], for: construction)
            .forEach{ gestureRecognizer in
                gestureRecognizer.addTarget(self.arView, action: #selector(arView.capScale(_:)))
            }
        // FUNÇÕES QUE ADICIONAM DE FATO NA CENA
        imageAnchorEntity.addChild(construction)
        arView.scene.addAnchor(imageAnchorEntity)
    }
}

extension ARView {
    func enableFindOutMore(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer){
        let tapLocation = recognizer.location(in: self)
        
        if let entity = self.entity(at: tapLocation) as? ModelEntity{
            if entity.name == "casa"{
                print(entity.name)
                Settings.shared.shouldOpenHouseView.toggle()
            } else if entity.name == "barraco" {
                print(entity.name)
                Settings.shared.shouldOpenShackView.toggle()
            } else if entity.name == "predio" {
                print(entity.name)
                Settings.shared.shouldOpenBuildingView.toggle()
            } else if entity.name == "palafita" {
                print(entity.name)
                Settings.shared.shouldOpenStiltHouseView.toggle()
            }
        }
    }
    
    func enableScaleCap(){
        let scaleGestureRecognizer = EntityScaleGestureRecognizer(target: self, action: #selector(capScale(_:)))
    }
    
    @objc func capScale(_ recognizer: EntityScaleGestureRecognizer){
        if recognizer.entity?.name != "predio" {
            if (recognizer.entity?.scale.x)! > 0.0002 {
                recognizer.entity?.transform.scale = SIMD3<Float>(0.0002, 0.0002, 0.00020)
            }
            if (recognizer.entity?.scale.x)! < 0.0001 {
                recognizer.entity?.transform.scale = SIMD3<Float>(0.0001, 0.0001, 0.0001)
            }
        }
        else {
            if (recognizer.entity?.scale.x)! > 0.0004 {
                recognizer.entity?.transform.scale = SIMD3<Float>(0.0004, 0.0004, 0.0004)
            }
            if (recognizer.entity?.scale.x)! < 0.00015 {
                recognizer.entity?.transform.scale = SIMD3<Float>(0.00015, 0.00015, 0.00015)
            }
        }
    }
}
