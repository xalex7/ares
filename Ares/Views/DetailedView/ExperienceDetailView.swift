//
//  ExperienceDetailView.swift
//  Ares
//
//  Created by Fady Eid on 1/29/23.
//

import SwiftUI

import OSLog

struct LazyView<Content: View>: View {
    let content: () -> Content
    @State private var visible = true
  
    init(_ content: @autoclosure @escaping () -> Content) {
        self.content = content
    }
    var body: some View {
        Group {
            if visible {
                content()
            }
        }
        .onAppear { visible = true }
        .onDisappear { visible = false }
    }
}

struct ExperienceDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isExpVisible = false
    @State var experienceModel: ExperienceModel?

    @ObservedObject var experienceItem: ListItem
    
    var body: some View {
        
        VStack (spacing: 20) {
            ContentHeaderView()

            VStack (spacing: 20) {
                Image(systemName: "photo.fill")
                Text(experienceItem.title)
                Text(experienceItem.description)
                IntensityView(intensityRange: experienceItem.intensity)
                Text("Duration \(experienceItem.duartion) seconds")
                Text("Completed \(String(UserDefaults.standard.bool(forKey: "completed-\(experienceItem.id)")))")
            }
            Spacer()
            StartButton(buttonText: "Start", buttonColor: .blue) {
                isExpVisible.toggle()
            }
            if let experienceModel {
                NavigationLink(destination: LazyView( ExperienceView(myModel: experienceModel)), isActive: $isExpVisible) {}
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: Button(action: { presentationMode.wrappedValue.dismiss()}) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("All Experiences")
                                .font(.title)
                        }
                    }
                    )
            }
        }
        .onAppear {
            experienceModel = ExperienceModel(listItem: experienceItem)
        }
    }
}

struct ExperienceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceDetailView(experienceItem: ListModel().list[0])
    }
}


