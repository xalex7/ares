//
//  ExperienceView.swift
//  Ares
//
//  Created by Fady Eid on 2/26/23.
//

import SwiftUI
import RealityKit
import ARKit


struct ExperienceView: View {
    
    @ObservedObject var myModel: ExperienceModel
    // You're observing changes to the model not the property
    
    
    var body: some View {

        VStack {
            
            ARViewContainer(activeModel: myModel).edgesIgnoringSafeArea(.all)
            
            Text("To Complete \(myModel.expDuration)").foregroundColor(Color(.white))
                .navigationBarBackButtonHidden(false)
                .navigationTitle("End")
        }
    }
}

extension ARView: ARCoachingOverlayViewDelegate {
    
    
    func addCoaching(goal: ARCoachingOverlayView.Goal) {
        
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.goal = goal
        coachingOverlay.session = session
        coachingOverlay.delegate = self
        addSubview(coachingOverlay)
        coachingOverlay.setActive(true, animated: true)
    }
    
    public func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        NotificationCenter.default.post(name: Notification.Name("ARCoachingDidDeactivate"), object: nil)
    }
}


struct ARViewContainer: UIViewRepresentable {
    let activeModel: ExperienceModel
    
    func makeUIView(context: Context) -> ARView {
        
        
        let arView = ARView(frame: .zero)
        
        arView.addCoaching(goal: activeModel.activeExperience.coachingGoal)
        
        arView.coachingOverlayViewDidDeactivate(ARCoachingOverlayView())
        
        
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(activeModel.activeScene)
        
        NotificationCenter.default.addObserver(forName: Notification.Name("ARCoachingDidDeactivate"), object: nil, queue: nil) { _ in
            activeModel.startTimer()
            NotificationCenter.default.removeObserver(self)
        }
        
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceView(myModel: ExperienceModel(listItem: ListModel().list.first! ))
    }
}
