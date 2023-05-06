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
    
    
    //  @Environment(\.presentationMode) var presentationMode
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var myModel: ExperienceModel
    
    @State private var congrats = ["Well done! 🎊", "Fantastic! ⭐️", "Excellent! 🎉"]
    
    @State private var dismissTimer: Timer?
    
    @State private var exitBackgroundOpacity = Color.accentColor.opacity(0)
    
    @State private var exitForegroundColor = Color.accentColor
    
    
    var body: some View {
        ARViewContainer(activeModel: myModel)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack {
                    Spacer()
                    VStack (spacing: 20) {
                            Text(myModel.expDuration < 20 && myModel.expDuration > 10 ? "Almost there" : "")
                            .foregroundColor(.cyan)
                            .font(.system(size: CGFloat(myModel.expDuration * 2)))
                                .animation(.easeOut(duration: 5))
                                .shadow(radius: 20)
                        
                        Text(myModel.expDuration > 0 ? "Time remaining \(myModel.expDuration)" : congrats.randomElement()!)
                            .foregroundColor(myModel.expDuration > 0 ? Color.white : Color.green)
                            .font(myModel.expDuration > 0 ? .title2 : .largeTitle)
                            
                    }
                    .fontWeight(.bold)
                    .animation(.easeOut(duration: 0.2))
                }
            )
            .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                if myModel.expDuration == 0 {
                    // Wait for 5 seconds then dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                dismiss()
            }) {
                VStack {
                    Text(LocalizedStringKey("Quit Now"))
                        .foregroundColor(exitForegroundColor)
                        .onAppear {
                            withAnimation(.linear(duration: 10)) {
                                exitForegroundColor = Color.white
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 7)
                        .font(.title)
                        .fontWeight(.bold)
                        .background(exitBackgroundOpacity)
                        .onAppear {
                            withAnimation(.linear(duration: 10)) {
                                exitBackgroundOpacity = Color.accentColor.opacity(1)
                            }
                        }
                        .cornerRadius(5)
                        .shadow(color: Color.accentColor, radius: 1)
                }
            })
            .onDisappear {
                myModel.stop()
            }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    var activeModel: ExperienceModel
    
    class Coordinator: NSObject, ARCoachingOverlayViewDelegate {
        var activeModel: ExperienceModel
        var arView: ARView
        
        init(arView: ARView, activeModel: ExperienceModel) {
            self.arView = arView
            self.activeModel = activeModel
        }
        
        func addCoaching(goal: ARCoachingOverlayView.Goal) {
            let coachingOverlay = ARCoachingOverlayView()
            coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            coachingOverlay.goal = goal
            coachingOverlay.session = arView.session
            coachingOverlay.delegate = self
            arView.addSubview(coachingOverlay)
            coachingOverlay.setActive(true, animated: true)
        }
        
        func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
            coachingOverlayView.removeFromSuperview()
            activeModel.startTimer()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(arView: ARView(frame: .zero), activeModel: activeModel)
    }
    
    func makeUIView(context: Context) -> ARView {
        
#if targetEnvironment(simulator)
        activeModel.startTimer()
#else
        context.coordinator.addCoaching(goal: activeModel.activeExperience.coachingGoal)
#endif
        
        
        // Add the item anchor to the scene
        context.coordinator.arView.scene.anchors.append(activeModel.activeScene)
        
        return context.coordinator.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    static func dismantleUIView(_ uiView: ARView, coordinator: Coordinator) {
        coordinator.arView.session.pause()
    }
    
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceView(myModel: ExperienceModel(listItem: ListModel().list.first! ))
    }
}
