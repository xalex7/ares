//
//  ContentView.swift
//  Ares
//
//  Created by Fady Eid on 1/3/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        
        VStack {
            ExperienceListView()
        }
    }
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
