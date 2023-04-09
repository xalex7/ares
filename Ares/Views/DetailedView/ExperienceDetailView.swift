//
//  ExperienceDetailView.swift
//  Ares
//
//  Created by Fady Eid on 1/29/23.
//

import SwiftUI

struct ExperienceDetailView: View {
    
    @State var isExpVisible = false
    
    
    
    @ObservedObject var experienceItem: ListItem
    @State var experinceModel: ExperienceModel!
    
    var body: some View {
        
        VStack {
            ContentHeaderView()
            
            VStack {
                Image(systemName: "photo.fill")
                Text(experienceItem.title)
                Text(experienceItem.description)
                IntensityView(intensityRange: experienceItem.intensity)
                Text("Duration \(experienceItem.duartion) seconds")
                Text("Completed \(String(experienceItem.completed))")
                
            }
            
            AppButton(buttonText: "Start", buttonColor: .cyan) {
                isExpVisible.toggle()
            }
            if let experinceModel { NavigationLink(destination: ExperienceView(myModel: experinceModel), isActive: $isExpVisible) {}
                
            }
        }
        .onAppear {
            guard experinceModel == nil else {return}
            experinceModel = ExperienceModel(listItem: experienceItem)
        }
    }
}

struct ExperienceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceDetailView(experienceItem: ListModel().list[0])
    }
}


