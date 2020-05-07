//
//  Buttons.swift
//  BricksUI
//
//  Created by Samuel Kebis on 02/05/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import SwiftUI

// MARK: - Custom Button Styles

struct BSFillButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        FillButton(color: color, configuration: configuration)
    }
    
    struct FillButton: View {
        var color: Color
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .bsTypo(.s1)
                .foregroundColor(isEnabled ? .white : .bsFontDisabled)
                .padding()
                .frame(minHeight: 56)
                .background(isEnabled ? color : Color.bsBasic.opacity(0.2))
                .cornerRadius(4)
                .opacity(configuration.isPressed ? 0.7 : 1)
        }
    }
}

struct BSOutlineButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        OutlineButton(color: color, configuration: configuration)
    }
    
    struct OutlineButton: View {
        var color: Color
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .bsTypo(.s1)
                .foregroundColor(isEnabled ? color : .bsFontDisabled)
                .padding()
                .frame(minHeight: 56)
                .background(isEnabled ? color.opacity(0.2) : Color.bsBasic.opacity(0.15))
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(isEnabled ? color : Color.bsBasic.opacity(0.5), lineWidth: 1)
                )
                .opacity(configuration.isPressed ? 0.7 : 1)
        }
    }
}

struct BSGhostButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        GhostButton(color: color, configuration: configuration)
    }
    
    struct GhostButton: View {
        var color: Color
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .bsTypo(.s1)
                .foregroundColor(isEnabled ? color : .bsFontDisabled)
                .padding()
                .frame(minHeight: 56)
                .background(Color.white)
                .cornerRadius(4)
                .opacity(configuration.isPressed ? 0.7 : 1)
        }
    }
}


// MARK: - Usage

extension Button {
    /// Changes the appearance of the button
    func style(_ style: BSButton.Style, color: Color) -> some View {
        Group {
            if style == .fill {
                self.buttonStyle(BSFillButtonStyle(color: color))
            } else if style == .outline {
                self.buttonStyle(BSOutlineButtonStyle(color: color))
            } else {
                self.buttonStyle(BSGhostButtonStyle(color: color))
            }
        }
    }
}

struct BSButton: View {
    enum Style { case fill, outline, ghost }
    
    var text: String?
    var image: Image?
    var style: Style = .fill
    var color: Color = .bsPrimary
    var action: () -> Void
    var textAndImage: Bool { text != nil && image != nil }
    
    var body: some View {
        Button(action: action, label: {
            HStack(spacing: textAndImage ? 12 : 0) {
                Text(text ?? "")
                image
            }
        }).style(style, color: color)
    }
}


// MARK: - Preview

struct Input_Previews: PreviewProvider {
    static let cloudImg = Image(systemName: "cloud.sun")
    
    static var previews: some View {
        VStack(spacing: 40) {
            
            HStack(spacing: 20) {
                BSButton(text: "Fill", style: .fill, action: { print("click") })
                BSButton(text: "Outline", style: .outline, action: { print("click") })
                BSButton(text: "Ghost", style: .ghost, action: { print("click") })
            }
            
            HStack(spacing: 20) {
                BSButton(text: "Danger", color: .bsDanger, action: { print("click") })
                BSButton(text: "Warning", color: .bsWarning, action: { print("click") })
                BSButton(text: "Success", color: .bsSuccess, action: { print("click") })
            }
            
            HStack(spacing: 20) {
                BSButton(text: "Disabled", style: .fill, action: { print("click") })
                    .disabled(true)
                BSButton(text: "Disabled", style: .outline, action: { print("click") })
                    .disabled(true)
                BSButton(text: "Disabled", style: .ghost, action: { print("click") })
                    .disabled(true)
            }
            
            HStack(spacing: 20) {
                BSButton(text: "Text", action: { print("click") })
                BSButton(text: "Text", image: cloudImg, action: { print("click") })
                BSButton(image: cloudImg, action: { print("click") })
            }
            
            Button(action: { print("click") }, label: { Text("Very Custom") })
                .style(.outline, color: .black)
        }
    }
}
