//
//  AppButton.swift
//  AresExperiences
//
//  Created by Fady Eid on 1/15/23.
//

import SwiftUI

struct StartButton: View {
    
    var buttonText: String
    var buttonColor: Color
    var buttonPressed: (()->Void)? // Provideing this whole is optional
    var body: some View {
        HStack {
            
            Button(action: {
                buttonPressed?()
            }) {
                Spacer()
                Text(buttonText)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            } .background(buttonColor, in:Rectangle())
                .cornerRadius(5)
                .foregroundColor(.white)
                .padding(.horizontal, 40)
                .shadow(color: Color.gray, radius: 3)
        }
    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton(buttonText:"Start", buttonColor: Color(.blue))
    }
}
