//
//  ExperienceModel.swift
//  Ares
//
//  Created by Fady Eid on 2/26/23.
//

import Foundation
import RealityKit
import ARKit
import Combine

class ExperienceModel: ObservableObject {

    let activeExperience: ARExperiences
    let activeScene: Scene.AnchorCollection.Element
    var createdListItem: ListItem
    @Published var expDuration: Int
    @Published var expCompleted: Bool
    
    
    var defaults = UserDefaults.standard
    
    var timerSubscriber: AnyCancellable?
    
    func startTimer() {
        print("Timer being called")
        timerSubscriber =  Timer.publish(every: 1, on: .main, in: .common).autoconnect().sink(receiveValue: { [unowned self] _ in
           
            print("TimerrrrrrrRRRRRR")
            
            if expDuration > 0 {
                expDuration -= 1
                print("duration deducted \(expDuration)")
            } else {

                // MARK: I need to change the value of `Completed` from false to True
                createdListItem.completed = true
                
                //expDuration = createdListItem.duartion
                
                defaults.set(createdListItem.completed, forKey: "completed-\(createdListItem.id)")
                print("THIS \(createdListItem.title) and \(createdListItem.completed)")

                timerSubscriber?.cancel()
            }
        })
    }
    
 
    
    enum ARExperiences {
        case first, second, third, fourth, fifth
        
        var scene: Scene.AnchorCollection.Element {
            switch self {
            case .first:
                return try! Experiences.loadFirstEx()
            case .second:
                return try! Experiences.loadSecondEx()
            case .third:
                return try! Experiences.loadThirdEx()
            case .fourth:
                return try! Experiences.loadFourthEx()
            case .fifth:
                return try! Experiences.loadFifthEx()
            }
        }

        
        

        var coachingGoal: ARCoachingOverlayView.Goal {
            switch self {
            case .first:
                return .horizontalPlane
            case .second:
                return .horizontalPlane
            case .third:
                return .verticalPlane
            case .fourth:
                return .verticalPlane
            case .fifth:
                return .horizontalPlane
                
            }
        }

    }

    init(listItem: ListItem) {
        
        createdListItem = listItem
        activeExperience = listItem.arExp
        activeScene = activeExperience.scene
        expDuration = listItem.duartion
        expCompleted = listItem.completed

    }
}
