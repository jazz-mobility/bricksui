//
//  Toggles.swift
//  BricksUI
//
//  Created by Fabio Staiano on 03/05/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import SwiftUI


struct ColoredToggleStyle: ToggleStyle {
    var onColor = bsColors.primary
    var offColor = bsColors.danger
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

struct bsTogglePrimary: View {
    @State private var toggleState: Bool = true
    
    var body: some View {
        VStack{
            Toggle("", isOn: $toggleState)
                .toggleStyle(
                    ColoredToggleStyle(
                        onColor: bsColors.primary,
                        offColor: bsColors.primary.opacity(0.1),
                        thumbColor: Color(UIColor.white)))
        }
    }
}

struct bsToggleSuccess: View {
    @State private var toggleState: Bool = true
    
    var body: some View {
        VStack{
            Toggle("", isOn: $toggleState)
                .toggleStyle(
                    ColoredToggleStyle(
                        onColor: bsColors.success,
                        offColor: bsColors.success.opacity(0.1),
                        thumbColor: Color(UIColor.white)))
        }
    }
}

struct bsToggleInfo: View {
    @State private var toggleState: Bool = true
    
    var body: some View {
        VStack{
            Toggle("", isOn: $toggleState)
                .toggleStyle(
                    ColoredToggleStyle(
                        onColor: bsColors.info,
                        offColor: bsColors.info.opacity(0.1),
                        thumbColor: Color(UIColor.white)))
        }
    }
}

struct bsToggleWarning: View {
    @State private var toggleState: Bool = true
    
    var body: some View {
        VStack{
            Toggle("", isOn: $toggleState)
                .toggleStyle(
                    ColoredToggleStyle(
                        onColor: bsColors.warning,
                        offColor: bsColors.warning.opacity(0.1),
                        thumbColor: Color(UIColor.white)))
        }
    }
}

struct bsToggleDanger: View {
    @State private var toggleState: Bool = true
    
    var body: some View {
        VStack{
            Toggle("", isOn: $toggleState)
                .toggleStyle(
                    ColoredToggleStyle(
                        onColor: bsColors.danger,
                        offColor: bsColors.danger.opacity(0.1),
                        thumbColor: Color(UIColor.white)))
        }
    }
}


struct Toggles_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            bsTogglePrimary()
            bsToggleSuccess()
            bsToggleInfo()
            bsToggleWarning()
            bsToggleDanger()
        }
    }
}
