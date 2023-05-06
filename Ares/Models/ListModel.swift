//
//  ListModel.swift
//  Ares
//
//  Created by Fady Eid on 1/28/23.
//

import Foundation
import RealityKit

/// `title` Title of the experience.
/// `description` Description of the experince.
/// `duration` Duration of the experience.
/// `intesity` Intensity of the experince.
/// `completed` Whether the user completed the experience before or not.
/// `arExp` Reality Entity of the experince.

class ListItem: Identifiable, ObservableObject {
    var id: Int
    var title: String
    var intensity: Int
    var description: String
    var duration: Int
    var anchor: String
    @Published var completed: Bool
    var arExp: ExperienceModel.ARExperiences
    
    init(id: Int, title: String, intensity: Int, description: String, duration: Int, anchor: String, completed: Bool, arExp: ExperienceModel.ARExperiences) {
        self.id = id
        self.title = title
        self.intensity = intensity
        self.description = description
        self.duration = duration
        self.anchor = anchor
        self.completed = completed
        self.arExp = arExp
    }
}

struct ListModel {
     var list: [ListItem] = [
        ListItem(id: 1, title: "Say hello to Pinky!", intensity: 1, description: "The happiest, friendliest home spider you’ll ever see! It won't move at all, so you can check its cute eyes, and adorable smile, it’s almost unfortunate it’s unreal! One more thing .. it’s pink!", duration: 60, anchor: "Horizontal", completed: false, arExp: .first),
        ListItem(id: 2, title: "Realistic still unreal", intensity: 2, description: "Meet your new friend, Home Spider! Although it looks realistic, it won't move. Home spiders are harmless", duration: 90, anchor: "Horizontal", completed: false, arExp: .second),
        ListItem(id: 3, title: "Journey on a wall", intensity: 3, description: "This one is always up for a chill walk on your wall. Don't worry, just like their real-life counterparts, Home Spiders are harmless and actually help keep your home bug-free", duration: 60, anchor: "Vertical", completed: false, arExp: .third),
        ListItem(id: 4, title: "Cute and jumpy!", intensity: 4, description: "Say hello to your new friend - the Jumping Spider! With its adorable appearance and lively personality, this little guy loves nothing more than exploring and hopping around. But don't worry, they are actually quite shy and won't jump on you", duration: 50, anchor: "Vertical", completed: false, arExp: .fourth),
        ListItem(id: 5, title: "Full house", intensity: 5, description: "This is it! Can you watch 3 jumping spiders wandering on your floor? If you can explore this one, you can do anything!", duration: 60, anchor: "Horizontal", completed: false, arExp: .fifth),
    ]
}
