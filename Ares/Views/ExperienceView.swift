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
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var myModel: ExperienceModel

    var body: some View {
        VStack {
            ARViewContainer(activeModel: myModel).edgesIgnoringSafeArea(.all)
                .overlay (
                    
                    VStack {
                        Spacer()
                        Text("To Complete \(myModel.expDuration)")
                    }
                )
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: { presentationMode.wrappedValue.dismiss()}) {
            HStack {
                ExitButton()
            }
        })
        .onDisappear {

            
        }.onReceive(myModel.$expDuration, perform: {print("HELLLLLLLLL\($0)")})
            .onReceive(myModel.$expCompleted, perform: {print("expCompleted \($0)")})
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
    
    var activeModel: ExperienceModel

    func makeUIView(context: Context) -> ARView {
        
        print("HELL")
        
        
        
        let arView = ARView(frame: .zero)
        
        arView.addCoaching(goal: activeModel.activeExperience.coachingGoal)
        
        arView.coachingOverlayViewDidDeactivate(ARCoachingOverlayView())
        
        // Add the item anchor to the scene
        arView.scene.anchors.append(activeModel.activeScene)
        
        NotificationCenter.default.addObserver(forName: Notification.Name("ARCoachingDidDeactivate"), object: nil, queue: nil) { _ in
            activeModel.startTimer()
            NotificationCenter.default.removeObserver(self)
            print("Notification received")
        }
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    static func dismantleUIView(_ uiView: ARView, coordinator: ()) {
        uiView.session.pause()
    }
    
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceView(myModel: ExperienceModel(listItem: ListModel().list.first! ))
    }
}
