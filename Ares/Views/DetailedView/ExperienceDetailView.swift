//
//  ExperienceDetailView.swift
//  Ares
//
//  Created by Fady Eid on 1/29/23.
//

import SwiftUI

struct ExperienceDetailView: View {
    
    @State var isExpVisible = false
    
    var experienceItem: ListItem
    
    var body: some View {
        
        VStack {
            ContentHeaderView()
            VStack {
                Image(systemName: "photo.fill")
                Text(experienceItem.title)
                Text(experienceItem.description)
                IntensityView(intensityRange: experienceItem.intensity)
                Text("Duration \(experienceItem.duartion) minute")
                Text("Completed \(String(experienceItem.completed))")
                
            }
            AppButton(buttonText: "Start", buttonColor: .cyan) {
                isExpVisible.toggle()
            }
            NavigationLink(destination: ExperienceView(), isActive: $isExpVisible) {
                
            }
        }
    }
}

struct ExperienceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceDetailView(experienceItem: ListModel().list[0])
    }
}


