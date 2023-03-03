//
//  ExperienceListView.swift
//  Ares
//
//  Created by Fady Eid on 1/18/23.
//

import SwiftUI

struct ExperienceListView: View {
    var experienceList = ListModel().list
    var body: some View {
        VStack {
            NavigationView {
                List(experienceList) { item in
                    NavigationLink(destination: ExperienceDetailView(experienceItem: item)) {
                        ListItemView(listItem: item)
                    }
                }
            }
        }
    }
}

struct ExperienceListView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceListView()
    }
}



