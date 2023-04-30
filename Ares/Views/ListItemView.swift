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
        
        VStack (alignment: .center ,spacing: 15) {
            Text(listItem.title)
                .font(.title)
                .foregroundColor(.accentColor)
            Text("Time \(listItem.duartion) Seconds")
            Text("\(listItem.anchor) surface")
            IntensityView(intensityRange: listItem.intensity)
        }
        .font(.title2)
        .fontWeight(.bold)
        

    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(listItem: ListModel().list[0])
    }
}


