//
//  ExperienceModel.swift
//  Ares
//
//  Created by Fady Eid on 2/26/23.
//

import Foundation
import RealityKit
import ARKit

class ExperienceModel {
    //    var timer: Timer
    //    var completed: Bool
    let activeExperience: ARExperiences
    let activeScene: Scene.AnchorCollection.Element
    
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
                //            default:
                //                return try! Experiences.loadFirstEx()
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
    
    init(activeExperience: ARExperiences) {
        //        self.timer = timer
        //        self.completed = completed
        self.activeExperience = activeExperience
        self.activeScene = self.activeExperience.scene
    }
}
