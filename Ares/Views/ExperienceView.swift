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
        ARViewContainer(activeModel: myModel).edgesIgnoringSafeArea(.all)
        
        //@State var expDuration = myModel.activeExperience.expDuration
        // MARK: Would it be better if I use an Observed Object from detailed view so I can change the value of both `Completed` and `Duration`

        Text("To Complete \(myModel.expDuration)").foregroundColor(Color(.white))
    }
}

extension ARView {
    func addCoaching(goal: ARCoachingOverlayView.Goal) {
        
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.goal = goal
        coachingOverlay.session = session
        addSubview(coachingOverlay)
        coachingOverlay.setActive(true, animated: true)
    }
}



struct ARViewContainer: UIViewRepresentable {
    let activeModel: ExperienceModel

    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        arView.addCoaching(goal: activeModel.activeExperience.coachingGoal)
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(activeModel.activeScene)
        
        activeModel.startTimer()
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceView(myModel: ExperienceModel(listItem: ListModel().list.first! ))
    }
}
