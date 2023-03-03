//
//  ExperienceModel.swift
//  Ares
//
//  Created by Fady Eid on 2/26/23.
//

import Foundation
import RealityKit

class ExperienceModel {
    var timer: Timer
    var completed: Bool
    var activeScene: Scene.AnchorCollection.Element?
    
    enum ARExperiences {
        case first, second, third, forth, fifth
        
        private var scene: Scene.AnchorCollection.Element {
            switch self {
            case .first:
                return try! Experiences.loadFirstEx()
            default:
                return try! Experiences.loadFirstEx()
            }
        }
    }
    
    init(timer: Timer, completed: Bool) {
        self.timer = timer
        self.completed = completed
    }
}
