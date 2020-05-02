//
//  Buttons.swift
//  BricksUI
//
//  Created by Samuel Kebis on 02/05/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import SwiftUI

extension Button {
    
    enum Style {
        case fill, outline, ghost
    }
    
    /// Changes the appearance of the button
    func style(_ style: Style) -> some View {
        Group {
            if style == .fill {
                self.buttonStyle(FillButtonStyle())
            } else if style == .outline {
                self.buttonStyle(OutlineButtonStyle())
            } else {
                self.buttonStyle(GhostButtonStyle())
            }
        }
    }
}

struct FillButtonStyle: ButtonStyle {
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .frame(minHeight: 56)
            .background(Colors.primary)
            .cornerRadius(10)
    }
}

struct OutlineButtonStyle: ButtonStyle {
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        configuration.label
            .font(.system(size: 17, weight: .heavy))
            .foregroundColor(Colors.primary)
            .padding()
            .frame(minHeight: 56)
            .background(Colors.primary.opacity(0.2))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Colors.primary, lineWidth: 4)
            )
    }
}

struct GhostButtonStyle: ButtonStyle {
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        configuration.label
            .font(.system(size: 17, weight: .heavy))
            .foregroundColor(Colors.primary)
            .padding()
            .frame(minHeight: 56)
            .background(Color.white)
            .cornerRadius(10)
    }
}


struct Input_Previews2: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.3)
            VStack(spacing: 30) {
                Button(action: { print("click") }, label: { Text("Fill") })
                    .style(.fill)
                Button(action: { print("click") }, label: { Text("Outline") })
                    .style(.outline)
                Button(action: { print("click") }, label: { Text("Ghost") })
                    .style(.ghost)
            }
        }
    }
}
