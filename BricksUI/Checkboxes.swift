//
//  Toggles.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI


public struct BSCheckbox: View {
    
    enum Style {
        case defaultStyle, disabled, success, warning, danger, info
    }
    
    @State var checkboxState: Bool = true
    var style: Style
    
    struct ColoredCheckboxStyle: ToggleStyle {
        var onColor = Color.bsPrimary
        var offColor = Color.bsFontDisabled
        
        func makeBody(configuration: Self.Configuration) -> some View {
            return HStack {
                configuration.label
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .onTapGesture { configuration.isOn.toggle() }
                .foregroundColor(configuration.isOn ? onColor : offColor)
            }
            
        }
    }
    
    
    public var body: some View {
        switch style {
        case .success: return AnyView(success())
        case .warning: return AnyView(warning())
        case .danger: return AnyView(danger())
        case .info: return AnyView(info())
        default: return AnyView(defaultStyle())
        }
    }
    
    
    fileprivate func defaultStyle() -> some View {
        Toggle("", isOn: $checkboxState)
            .toggleStyle(ColoredCheckboxStyle(onColor: .bsPrimary, offColor: .bsFontDisabled))
    }
    
    fileprivate func success() -> some View {
            Toggle("", isOn: $checkboxState)
            .toggleStyle(ColoredCheckboxStyle(onColor: .bsSuccess, offColor: .bsFontDisabled))
    }
    
    fileprivate func info() -> some View {
        Toggle("", isOn: $checkboxState)
        .toggleStyle(ColoredCheckboxStyle(onColor: .bsInfo, offColor: .bsFontDisabled))
    }
    
    
    fileprivate func warning() -> some View {
        Toggle("", isOn: $checkboxState)
        .toggleStyle(ColoredCheckboxStyle(onColor: .bsWarning, offColor: .bsFontDisabled))
    }
    
    
    fileprivate func danger() -> some View {
        Toggle("", isOn: $checkboxState)
        .toggleStyle(ColoredCheckboxStyle(onColor: .bsDanger, offColor: .bsFontDisabled))
    }
}


struct Checkboxes_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10){
            BSCheckbox(checkboxState: true, style: .defaultStyle)
            BSCheckbox(checkboxState: true, style: .success)
            BSCheckbox(checkboxState: true, style: .info)
            BSCheckbox(checkboxState: true, style: .warning)
            BSCheckbox(checkboxState: true, style: .danger)
        }
    }
}
