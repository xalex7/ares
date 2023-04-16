//
//  ListItemView.swift
//  Ares
//
//  Created by Fady Eid on 1/18/23.
//

import SwiftUI

struct ListItemView: View {
    
 // MARK: Doesn't this mean that all 6 experinces are being created?
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
                    Text("Period \(listItem.duartion) Seconds")
                    IntensityView(intensityRange: listItem.intensity)
                    Text("Completed: \(String(listItem.completed))")
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


