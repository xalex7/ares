//
//  AppButton.swift
//  AresExperiences
//
//  Created by Fady Eid on 1/15/23.
//

import SwiftUI

struct AppButton: View {
    
    var buttonText: String
    var buttonColor: Color
    var buttonPressed: (()->Void)? // Provideing this whole is optional
    var body: some View {
        HStack {
            
            Button(action: { buttonPressed?() }) {
                Spacer()
                Text(buttonText)
                
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .cornerRadius(5)
                Spacer()
            } .background(buttonColor, in:Capsule())
                .foregroundColor(.white)
                .padding(5)
        }
    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(buttonText:"Start", buttonColor: Color(.cyan))
    }
}
