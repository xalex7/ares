//
//  ListModel.swift
//  Ares
//
//  Created by Fady Eid on 1/28/23.
//

import Foundation
import RealityKit

/// `title` Title of the experience.
/// `brief` Brief description of the experince.
/// `description` Description of the experince.
/// `duration` Duration of the experience.
/// `intesity` Intensity of the experince.
/// `completed` Whether the user completed the experience before or not.
/// `arExp` Reality Entity of the experince.


class ListItem: Identifiable, ObservableObject {
    var id: Int
    var title: String
    var intensity: Int
    var brief: String
    var description: String
    var duartion: Int
    @Published var completed: Bool
    var arExp: ExperienceModel.ARExperiences
    
    init(id: Int, title: String, intensity: Int, brief: String, description: String, duartion: Int, completed: Bool, arExp: ExperienceModel.ARExperiences) {
        self.id = id
        self.title = title
        self.intensity = intensity
        self.brief = brief
        self.description = description
        self.duartion = duartion
        self.completed = completed
        self.arExp = arExp
    }
}



struct ListModel {
     var list: [ListItem] = [
        ListItem(id: 1, title: "Say hello to Pinky!", intensity: 1, brief: "Cartoony Still Spider", description: "The happiest, friendliest home spider you’ll ever see! It won't move at all, so you can check its cute eyes, and adorable smile, it’s almost unfortunate it’s unreal! One more thing .. it’s pink!", duartion: 3, completed: false, arExp: .first),
        ListItem(id: 2, title: "Moving Home Spider", intensity: 2, brief: "A still spider that never moves", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", duartion: 10, completed: false, arExp: .second),
        ListItem(id: 3, title: "Still Jumping Spider", intensity: 2, brief: "A still spider that never moves", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", duartion: 60, completed: false, arExp: .third),
        ListItem(id: 4, title: "Moving Jumping Spider", intensity: 3, brief: "A still spider that never moves", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", duartion: 60, completed: false, arExp: .fourth),
        ListItem(id: 5, title: "Moving Black Widow", intensity: 3, brief: "A still spider that never moves", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", duartion: 60, completed: false, arExp: .fifth),
        
    ]
}
