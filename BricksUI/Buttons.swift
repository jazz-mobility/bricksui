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
            case .primary: return .bsPrimary
            case .success: return .bsSuccess
            case .warning: return .bsWarning
            case .danger: return .bsDanger
            case .info: return .bsInfo
            }
        }
    }
    
    /// Changes the appearance of the button
    func style(_ style: Style, status: Status = .primary) -> some View {
        Group {
            if style == .fill {
                self.buttonStyle(BSFillButtonStyle(color: status.color))
            } else if style == .outline {
                self.buttonStyle(BSOutlineButtonStyle(color: status.color))
            } else {
                self.buttonStyle(BSGhostButtonStyle(color: status.color))
            }
        }
    }
}

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
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(isEnabled ? .white : .bsFontDisabled)
                .padding()
                .frame(minHeight: 56)
                .background(isEnabled ? color : Color.bsBasic.opacity(0.2))
                .cornerRadius(4)
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
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(isEnabled ? color : .bsFontDisabled)
                .padding()
                .frame(minHeight: 56)
                .background(isEnabled ? color.opacity(0.2) : Color.bsBasic.opacity(0.15))
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(isEnabled ? color : Color.bsBasic.opacity(0.5), lineWidth: 1)
                )
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
                .font(.system(size: 17, weight: .heavy))
                .foregroundColor(isEnabled ? color : .bsFontDisabled)
                .padding()
                .frame(minHeight: 56)
                .background(Color.white)
                .cornerRadius(4)
        }
    }
}


struct Input_Previews2: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 60) {
            HStack(spacing: 20) {
                Button(action: { print("click") }, label: { Text("Fill") })
                    .style(.fill)
                Button(action: { print("click") }, label: { Text("Outline") })
                    .style(.outline)
                Button(action: { print("click") }, label: { Text("Ghost") })
                    .style(.ghost)
            }
            HStack(spacing: 20) {
                Button(action: { print("click") }, label: { Text("Danger") })
                    .style(.outline, status: .danger)
                Button(action: { print("click") }, label: { Text("Warning") })
                    .style(.outline, status: .warning)
                Button(action: { print("click") }, label: { Text("Success") })
                    .style(.outline, status: .success)
            }
            HStack(spacing: 20) {
                Button(action: { print("click") }, label: { Text("Disabled") })
                    .style(.fill)
                    .disabled(true)
                Button(action: { print("click") }, label: { Text("Disabled") })
                    .style(.outline)
                    .disabled(true)
                Button(action: { print("click") }, label: { Text("Disabled") })
                    .style(.ghost)
                    .disabled(true)
            }
        }
    }
}
