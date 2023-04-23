//
//  EndButton.swift
//  Ares
//
//  Created by Fady Eid on 4/22/23.
//

import SwiftUI

struct ExitButton: View {

    
    var body: some View {

            Text(LocalizedStringKey("Exit Now"))
                .padding(.horizontal, 20)
                .font(.title)
                .fontWeight(.bold)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(2)
                .shadow(color: Color.black, radius: 1)

    }
}
        
        struct EndButton_Previews: PreviewProvider {
            static var previews: some View {
                ExitButton()
            }
        }
        
        

