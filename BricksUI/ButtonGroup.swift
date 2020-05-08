//
//  ButtonGroupContainer.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import Foundation
import SwiftUI


//NOTE: THIS FILE IS NOT FINISHED
// WORK IN PROGRESS, PROTOTYPING THE FUNCTION'S ARCHITECTURE

/// Struct to create a row of formatted buttons
struct ButtonGroup: View {
    
    var icon : Image?
    var buttonItems : Int
    var text: String = ""
    var colorStyle : ColorStyle
    var size : Size
    @State var isActive: Bool = false
    
    enum Size {
        case giant, large, medium, small, tiny
        
        var style: ButtonGroupStyle.SizeStyle {
            switch self {
            case .giant: return ButtonGroupStyle.SizeStyle.giant
            case .large: return ButtonGroupStyle.SizeStyle.large
            case .medium: return  ButtonGroupStyle.SizeStyle.medium
            case .small: return  ButtonGroupStyle.SizeStyle.small
            case .tiny: return ButtonGroupStyle.SizeStyle.tiny
            }
        }
        
    }
    
    ///giant, large, medium, small and tiny options
   // typealias ButtonSize = ButtonGroupStyle.SizeStyle
    ///primary, basic or outline options
    typealias ColorStyle = ButtonGroupStyle.Style
    
    
    var body : some View {
        VStack {
            HStack(spacing: 1) {
                ForEach(0..<buttonItems) { i in
                    Button(action: {}, label: {
                        Group {
                            if self.icon != nil {
                                self.icon!.bsSquare(width: self.size.style.iconScale)
                            } else {
                                Text(self.text)
                            }
                        }
                    }
                    ).buttonStyle(ButtonGroupStyle(sizesStyle: self.size.style, colorStyle: self.colorStyle))
                    
                }
                //: Mark -The code below won't compile:
                // Avoid this in SwiftUI
                //            if case .active = featureState {
                //                Text("Active view!")
                //            } else {
                //                Text("Disabled view")
                //            }
                
                
            }.cornerRadius(self.size.style.frameWidth / 10)
                .overlay(RoundedRectangle(cornerRadius: ((colorStyle == ColorStyle.outline) && (!isActive)) ? (self.size.style.frameWidth / 10) : 0).stroke(Color.bsActiveBasic, lineWidth:(colorStyle == ColorStyle.outline) && (!isActive) ? 1 : 0))
        }
    }
}


struct ButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        VStack {

            ButtonGroup(icon: Image(systemName: "star"), buttonItems: 5, text: "won't read me", colorStyle: .primary, size: .giant)

            ButtonGroup(icon: nil, buttonItems: 5, text: "L", colorStyle: .basic, size: .large)
            
            ButtonGroup(icon: Image(systemName: "person"), buttonItems: 5, text: "hi", colorStyle: .outline, size: .medium, isActive: false)

            ButtonGroup(icon: nil, buttonItems: 5, text: "S", colorStyle: .primary, size: .small)

            ButtonGroup(icon: Image(systemName: "umbrella.fill"), buttonItems: 5, text: "T", colorStyle: .basic, size: .tiny)
        }
    }
}
