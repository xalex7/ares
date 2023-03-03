//
//  ListModel.swift
//  Ares
//
//  Created by Fady Eid on 1/28/23.
//

import Foundation
import RealityKit

/// `title` The title of the experience.
/// `brief` a brief description of the experince.
/// `description` description of the experince.
/// `duration` duration of the experience.
/// `intesity` the intensity of the experince.
/// `completed` whether the user completed the experience before or not.


struct ListItem: Identifiable {
    var id: Int
    var title: String
    var intensity: Int
    var brief: String
    var description: String
    var duartion: Int
    var completed: Bool
    var arExp: RealityKit.Entity
}

//var listItemTest = ListItem(id: 1, title: "Cartoony Still Spider", intensity: 3, brief: "Cartoony Still Spider", description: "- The happiest, friendliest home spider you’ll ever see! With its cute eyes, and adorable smile, it’s almost unfortunate it’s not real! One more thing .. it’s pink!", duartion: 1, completed: false)

struct ListModel {
    var list: [ListItem] = [
        ListItem(id: 1, title: "Cartoony Home Spider", intensity: 1, brief: "Cartoony Still Spider", description: "The happiest, friendliest home spider you’ll ever see! It won't move at all, so you can check its cute eyes, and adorable smile, it’s almost unfortunate it’s unreal! One more thing .. it’s pink!", duartion: 1, completed: false, arExp: ARViewContainer().firstExpAnchor),
//        ListItem(id: 2, title: "Moving Home Spider", intensity: 2, brief: "A still spider that never moves", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", duartion: 2, completed: true),
//        ListItem(id: 3, title: "Still Jumping Spider", intensity: 2, brief: "A still spider that never moves", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", duartion: 3, completed: false),
//        ListItem(id: 4, title: "Moving Jumping Spider", intensity: 3, brief: "A still spider that never moves", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", duartion: 4, completed: false),
//        ListItem(id: 5, title: "Moving Black Widow", intensity: 3, brief: "A still spider that never moves", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", duartion: 5, completed: false),

    ]
}
