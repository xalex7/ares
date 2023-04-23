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
        HStack {
            Text("Intensity")
                .font(.title)
                .fontWeight(.medium)
            ForEach(0..<intensityRange) { item in
                Image(systemName: "circle.fill")
                    .font(.caption)
                    .foregroundColor(.blue)
                    
            }
        }
    }
}

struct IntensityView_Previews: PreviewProvider {
    static var previews: some View {
        IntensityView(intensityRange: 3)
    }
}
