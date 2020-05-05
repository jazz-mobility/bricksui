//
//  Toggles.swift
//  BricksUI
//
//  Created by Fabio Staiano on 03/05/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import SwiftUI

struct BSToggle: View {
    
    enum Style {
        case defaultStyle,
        disabled,
        success,
        warning,
        danger,
        info
    }
    
    @State var toggleState: Bool = true
    var style: Style
    
    struct ColoredToggleStyle: ToggleStyle {
        var onColor = Color.bsPrimary
        var offColor = Color.bsDanger
        var thumbColor = Color.white
        
        func makeBody(configuration: Self.Configuration) -> some View {
            VStack {
                Button(action: { configuration.isOn.toggle() } )
                {
                    RoundedRectangle(cornerRadius: 16, style: .circular)
                        .fill(configuration.isOn ? onColor : offColor)
                        .frame(width: 50, height: 29)
                        .overlay(
                            ZStack{
                                Circle()
                                    .fill(thumbColor)
                                    .shadow(radius: 1, x: 0, y: 1)
                                    .padding(1.5)
                                    .offset(x: configuration.isOn ? 10 : -10)
                                Image(systemName: configuration.isOn ? "checkmark" : "")
                                    .font(.system(size: 12, weight: .black))
                                    .foregroundColor(onColor)
                                    .offset(x: configuration.isOn ? 10 : -10)
                                
                        })
                        .animation(Animation.easeInOut(duration: 0.1))
                }
            }
            .font(.title)
            .padding(.horizontal)
        }
    }
    
    
    var body: some View {
        switch style {
        case .success:
            return AnyView(success())
        case .warning:
            return AnyView(warning())
        case .danger:
            return AnyView(danger())
        case .info:
            return AnyView(info())
        default:
            return AnyView(defaultStyle())
        }
    }
    
    
    
    fileprivate func defaultStyle() -> some View {
        VStack{
            Toggle("", isOn: $toggleState)
                .toggleStyle(
                    ColoredToggleStyle(
                        onColor: .bsPrimary,
                        offColor: Color.bsPrimary.opacity(0.1),
                        thumbColor: .white))
        }
    }
    
    fileprivate func success() -> some View {
        VStack{
            Toggle("", isOn: $toggleState)
                .toggleStyle(
                    ColoredToggleStyle(
                        onColor: .bsSuccess,
                        offColor: Color.bsSuccess.opacity(0.1),
                        thumbColor: .white))
        }
    }
    
    fileprivate func info() -> some View {
        VStack{
            Toggle("", isOn: $toggleState)
                .toggleStyle(
                    ColoredToggleStyle(
                        onColor: .bsInfo,
                        offColor: Color.bsInfo.opacity(0.1),
                        thumbColor: .white))
        }
    }
    
    
    fileprivate func warning() -> some View {
        VStack{
            Toggle("", isOn: $toggleState)
                .toggleStyle(
                    ColoredToggleStyle(
                        onColor: .bsWarning,
                        offColor: Color.bsWarning.opacity(0.1),
                        thumbColor: .white))
        }
    }
    
    
    fileprivate func danger() -> some View {
        VStack{
            Toggle("", isOn: $toggleState)
                .toggleStyle(
                    ColoredToggleStyle(
                        onColor: .bsDanger,
                        offColor: Color.bsDanger.opacity(0.1),
                        thumbColor: .white))
        }
    }
    
    
}

struct Toggles_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            BSToggle(style: .defaultStyle)
            BSToggle(style: .success)
            BSToggle(style: .info)
            BSToggle(style: .warning)
            BSToggle(style: .danger)
            
        }
    }
}
