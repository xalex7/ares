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
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var expDuration: Int
    
    var timerSubscriber: AnyCancellable?
    
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
        
        //        self.completed = completed
        createdListItem = listItem
        activeExperience = listItem.arExp
        activeScene = activeExperience.scene
        expDuration = listItem.duartion
        
        timerSubscriber = timer.sink(receiveValue: { [unowned self] _ in
            if expDuration > 0 {
                expDuration -= 1
            } else {
                print("hello")
                // MARK: I need to change the value of `Completed` from false to True
            }
        })
    }
}
