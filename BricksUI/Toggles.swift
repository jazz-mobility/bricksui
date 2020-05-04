//
//  Toggles.swift
//  BricksUI
//
//  Created by Fabio Staiano on 03/05/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import SwiftUI


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

struct bsTogglePrimary: View {
    @State private var toggleState: Bool = true
    
    var body: some View {
        VStack{
            Toggle("", isOn: $toggleState)
                .toggleStyle(
                    ColoredToggleStyle(
                        onColor: .bsPrimary,
                        offColor: Color.bsPrimary.opacity(0.1),
                        thumbColor: .white))
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
                        onColor: .bsSuccess,
                        offColor: Color.bsSuccess.opacity(0.1),
                        thumbColor: .white))
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
                        onColor: .bsInfo,
                        offColor: Color.bsInfo.opacity(0.1),
                        thumbColor: .white))
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
                        onColor: .bsWarning,
                        offColor: Color.bsWarning.opacity(0.1),
                        thumbColor: .white))
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
                        onColor: .bsDanger,
                        offColor: Color.bsDanger.opacity(0.1),
                        thumbColor: .white))
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
