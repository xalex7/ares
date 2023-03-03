//
//  ListItemView.swift
//  Ares
//
//  Created by Fady Eid on 1/18/23.
//

import SwiftUI

struct ListItemView: View {
    
    //var listItem: ListItem = listItemTest
    var listItem: ListItem = ListModel().list[0]
    
    var body: some View {
        
        VStack {
            HStack (alignment: .center, spacing: 15) {
                Image(systemName: "photo.circle.fill")
                    .font(.title)
                    .foregroundColor(.accentColor)
                
                VStack {
                    Text(listItem.title)
                        .font(.title)
                        .foregroundColor(.accentColor)
                        .fontWeight(.bold)
                    IntensityView(intensityRange: listItem.intensity)
                        .font(.title2)
                }
            }
            Text(listItem.brief)
                .font(.title2)
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(listItem: ListModel().list[0])
    }
}


