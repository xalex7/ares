//
//  ContentView.swift
//  Ares
//
//  Created by Fady Eid on 1/3/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
        
        // Mark: Adding the button
        VStack {
            Image(systemName: "Globe")
                .imageScale(.large)
                .foregroundColor(Color.blue)
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap)))
        
        context.coordinator.view = arView
        
        context.coordinator.setupSceneObservers()
        
        let anchor = AnchorEntity(plane: .horizontal)
        
        let plane = try! ModelEntity.load(named: "Plane")
        
        anchor.addChild(plane)
        arView.scene.anchors.append(anchor)
        
        return arView
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
