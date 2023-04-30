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
        .onAppear {
            visible = true
            UITableView.appearance().isScrollEnabled = false
        }
        .onDisappear { visible = false }
    }
}

struct ExperienceDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isExpVisible = false
    @State var experienceModel: ExperienceModel?
    
    @ObservedObject var experienceItem: ListItem
    
    var body: some View {
        
        VStack {
            
            VStack (spacing: 50) {
                Text(experienceItem.title)
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                Text(experienceItem.description)
                    .lineSpacing(10)
                    .padding(.horizontal, 20)
                Text((UserDefaults.standard.bool(forKey: "completed-\(experienceItem.id)")) == true ? "\(Image(systemName: "checkmark.seal.fill")) Explored!" : "Unexplored" )
                    .foregroundColor(.accentColor)
                IntensityView(intensityRange: experienceItem.intensity)
                HStack {
                    Image(systemName: "timer")
                    Text("\(experienceItem.duartion) seconds")
                }
                
            }
            .font(.system(.title2, design: .rounded))
            .fontWeight(.semibold)

            StartButton(buttonText: "Start", buttonColor: .accentColor) {
                isExpVisible.toggle()
            }
            .padding(.top, 100)
            if let experienceModel {
                NavigationLink(destination: LazyView( ExperienceView(myModel: experienceModel)), isActive: $isExpVisible) {}
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


