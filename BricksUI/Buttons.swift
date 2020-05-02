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
    
    enum Status {
        case primary, success, warning, danger, info
        
        var color: Color {
            switch self {
            case .primary: return Colors.primary
            case .success: return Colors.success
            case .warning: return Colors.warning
            case .danger: return Colors.danger
            case .info: return Colors.info
            }
        }
    }
    
    /// Changes the appearance of the button
    func style(_ style: Style, status: Status = .primary) -> some View {
        Group {
            if style == .fill {
                self.buttonStyle(FillButtonStyle(color: status.color))
            } else if style == .outline {
                self.buttonStyle(OutlineButtonStyle(color: status.color))
            } else {
                self.buttonStyle(GhostButtonStyle(color: status.color))
            }
        }
    }
}

struct FillButtonStyle: ButtonStyle {
    var color: Color
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .frame(minHeight: 56)
            .background(color)
            .cornerRadius(10)
    }
}

struct OutlineButtonStyle: ButtonStyle {
    var color: Color
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        configuration.label
            .font(.system(size: 17, weight: .heavy))
            .foregroundColor(color)
            .padding()
            .frame(minHeight: 56)
            .background(color.opacity(0.2))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(color, lineWidth: 4)
            )
    }
}

struct GhostButtonStyle: ButtonStyle {
    var color: Color
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        configuration.label
            .font(.system(size: 17, weight: .heavy))
            .foregroundColor(color)
            .padding()
            .frame(minHeight: 56)
            .background(Color.white)
            .cornerRadius(10)
    }
}


struct Input_Previews2: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            HStack(spacing: 30) {
                Button(action: { print("click") }, label: { Text("Fill") })
                    .style(.fill)
                Button(action: { print("click") }, label: { Text("Outline") })
                    .style(.outline)
                Button(action: { print("click") }, label: { Text("Ghost") })
                    .style(.ghost)
            }
            HStack(spacing: 30) {
                Button(action: { print("click") }, label: { Text("Fill") })
                    .style(.fill, status: .warning)
                Button(action: { print("click") }, label: { Text("Outline") })
                    .style(.outline, status: .warning)
                Button(action: { print("click") }, label: { Text("Ghost") })
                    .style(.ghost, status: .warning)
            }
            HStack(spacing: 30) {
                Button(action: { print("click") }, label: { Text("Fill") })
                    .style(.fill, status: .success)
                Button(action: { print("click") }, label: { Text("Outline") })
                    .style(.outline, status: .success)
                Button(action: { print("click") }, label: { Text("Ghost") })
                    .style(.ghost, status: .success)
            }
        }
    }
}
