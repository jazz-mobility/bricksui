//
//  ButtonGroup.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

public struct GroupButtonStyle: ButtonStyle {
    
    var sizesStyle: SizeStyle
    var colorStyle: Style
    var icon: Image? = nil
    var text: String = ""
    var action: ()->() = {}
    @State var isActive: Bool = false
    
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            
            .font(.system(size: sizesStyle.fontSize, weight: .bold))
            .frame(width: sizesStyle.frameWidth, height: sizesStyle.frameWidth)
            .foregroundColor(isActive ? colorStyle.activeForeground : colorStyle.defaultForeground)
            .background(isActive ? colorStyle.activeBackground : colorStyle.defaultBackground)
            .border(colorStyle.defaultForeground, width: (colorStyle == .outline && !isActive) ? 1 : 0)
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

struct GroupButtonStyle_Previews: PreviewProvider {
    typealias bsSize = GroupButtonStyle.SizeStyle
    
    static var previews: some View {
        
        VStack(spacing : 20) {
            // must apply size for icon and text in the makeGroup logic
            HStack(spacing: 20) {
                
                Button(action : {  }, label: {Text("G")})
                    .buttonStyle(GroupButtonStyle(sizesStyle: .giant, colorStyle: .primary ))
                
                Button(action : {}, label: {Text("L")})
                    .buttonStyle(GroupButtonStyle(sizesStyle: .large, colorStyle: .basic ))
            }
        
            HStack(spacing: 20) {
                Button(action : {}, label: {Text("M")})
                    .buttonStyle(GroupButtonStyle(sizesStyle: .medium, colorStyle: .outline ))
                
                Button(action : {}, label: {Text("S")})
                    .buttonStyle(GroupButtonStyle(sizesStyle: .small, colorStyle: .basic ))
            }
            
            HStack(spacing: 20) {
                
                Button(action : {}, label: {Text("T")})
                    .buttonStyle(GroupButtonStyle(sizesStyle: .tiny, colorStyle: .primary ))
            }
            
            HStack(spacing: 20) {
                
                Button(action : {}, label: {Image(systemName: "star.fill").bsSquare(width: bsSize.large.iconScale)})
                    .buttonStyle(GroupButtonStyle(sizesStyle: .medium, colorStyle: .basic))
                
                Button(action : {}, label: {Image(systemName: "person").bsSquare(width: bsSize.large.iconScale)})
                    .buttonStyle(GroupButtonStyle(sizesStyle: .medium, colorStyle: .outline))
                
                Button(action : {}, label: {Image(systemName: "umbrella").bsSquare(width: bsSize.large.iconScale)})
                    .buttonStyle(GroupButtonStyle(sizesStyle: .medium, colorStyle: .primary))
            }
        }
    }
}
