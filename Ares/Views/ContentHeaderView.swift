//
//  ContentHeaderView.swift
//  Ares
//
//  Created by Fady Eid on 1/18/23.
//

import SwiftUI

struct ContentHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .imageScale(.large)
            Text("ARES")
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

struct ContentHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentHeaderView()
    }
}
