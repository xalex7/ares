//
//  ExperienceView.swift
//  Ares
//
//  Created by Fady Eid on 2/26/23.
//

import SwiftUI
import RealityKit

struct ExperienceView: View {
    
    let myModel: ExperienceModel
    
    var body: some View {
        ARViewContainer(myModel: myModel).edgesIgnoringSafeArea(.all)
    }
}



struct ARViewContainer: UIViewRepresentable {
    let myModel: ExperienceModel

    
    // Load the "Box" scene from the "Experience" Reality File
//    let firstExpAnchor = try! Experiences.loadFirstEx()
//    let secondExpAnchor = try! Experiences.loadSecondEx()
//    let thirdExpAnchor = try! Experiences.loadThirdEx()
//    let fourthExpAnchor = try! Experiences.loadFourthEx()
//    let fifthExpAnchor = try! Experiences.loadFifthEx()
    
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(myModel.activeScene)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceView(myModel: ExperienceModel(activeExperience: .first))
    }
}
