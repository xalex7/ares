//
//  ExperienceView.swift
//  Ares
//
//  Created by Fady Eid on 2/26/23.
//

import SwiftUI
import RealityKit

struct ExperienceView: View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    let firstExpAnchor = try! Experiences.loadFirstEx()
    let secondExpAnchor = try! Experiences.loadSecondEx()
    let thirdExpAnchor = try! Experiences.loadThirdEx()
    let fourthExpAnchor = try! Experiences.loadFourthEx()
    let fifthExpAnchor = try! Experiences.loadFifthEx()
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        //let firstExpAnchor = try! Experiences.loadFirstEx()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(firstExpAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceView()
    }
}
