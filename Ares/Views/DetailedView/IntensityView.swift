//
//  IntensityView.swift
//  Ares
//
//  Created by Fady Eid on 1/29/23.
//

import SwiftUI

struct IntensityView: View {
    var intensityRange: Int
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "speedometer")
                Text("Bravemeter")
            }
            
            HStack {
                ForEach(0..<intensityRange) { item in
                    Text("💪")
                }
            }
        }
    }
}

struct IntensityView_Previews: PreviewProvider {
    static var previews: some View {
        IntensityView(intensityRange: 3)
    }
}
