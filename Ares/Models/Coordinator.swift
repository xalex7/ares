//
//  Coordinator.swift
//  Ares
//
//  Created by Fady Eid on 1/4/23.
//

import Foundation
import ARKit
import RealityKit
import Combine

class Coordinator: NSObject, ARSessionDelegate {
    weak var view: ARView?
    var anchoredStateSubscriber: (any Cancellable)?
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        guard let view = self.view else {return} // To get access to the view.
        let tapLocation = recognizer.location(in: view) // To get the tap location.
        
        // MARK: The tap is sat up. I need to add what to do when tapped.
    }
    
    func setupSceneObservers() {
        guard let view else { return }
        
        anchoredStateSubscriber = view.scene.subscribe(to: SceneEvents.AnchoredStateChanged.self) { event in
            if event.anchor.isActive {
                for entity in event.anchor.children {
                    for animations in entity.availableAnimations {
                        entity.playAnimation(animations.repeat())
                    }
                }
            }
        }
    }
}
