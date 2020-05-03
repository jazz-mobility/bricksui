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
            case .primary: return bsColors.primary
            case .success: return bsColors.success
            case .warning: return bsColors.warning
            case .danger: return bsColors.danger
            case .info: return bsColors.info
            }
        }
    }
    
    /// Changes the appearance of the button
    func style(_ style: Style, status: Status = .primary) -> some View {
        Group {
            if style == .fill {
                self.buttonStyle(bsFillButtonStyle(color: status.color))
            } else if style == .outline {
                self.buttonStyle(bsOutlineButtonStyle(color: status.color))
            } else {
                self.buttonStyle(bsGhostButtonStyle(color: status.color))
            }
        }
    }
}

struct bsFillButtonStyle: ButtonStyle {
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
                .foregroundColor(isEnabled ? .white : bsColors.fontDisabled)
                .padding()
                .frame(minHeight: 56)
                .background(isEnabled ? color : bsColors.basic.opacity(0.2))
                .cornerRadius(4)
        }
    }
}

struct bsOutlineButtonStyle: ButtonStyle {
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
                .foregroundColor(isEnabled ? color : bsColors.fontDisabled)
                .padding()
                .frame(minHeight: 56)
                .background(isEnabled ? color.opacity(0.2) : bsColors.basic.opacity(0.15))
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(isEnabled ? color : bsColors.basic.opacity(0.5), lineWidth: 1)
                )
        }
    }
}

struct bsGhostButtonStyle: ButtonStyle {
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
                .foregroundColor(isEnabled ? color : bsColors.fontDisabled)
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
