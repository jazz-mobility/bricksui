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

struct GroupButtonContainer: View {
    var icon : Image?
    var buttonItems : Int
    var text: String = ""
    var colorStyle : ColorStyle
    var size : ButtonSize
    @State var isActive: Bool = false
    
    
    typealias ButtonSize = GroupButtonStyle.SizeStyle
    typealias ColorStyle = GroupButtonStyle.Style
    
    
    var body : some View {
        VStack {
            HStack(spacing: 1) {
                ForEach(0..<buttonItems) { i in
                    Button(action: {}, label: {
                        Group {
                            if self.icon != nil {
                                self.icon!.bsSquare(width: self.size.iconScale)
                            } else {
                                Text(self.text)
                            }
                        }
                    }
                    ).buttonStyle(GroupButtonStyle(sizesStyle: self.size, colorStyle: self.colorStyle))
                    
                }
                //: Mark -The code below won't compile:
                // Avoid this in SwiftUI
                //            if case .active = featureState {
                //                Text("Active view!")
                //            } else {
                //                Text("Disabled view")
                //            }
                
                
            }.cornerRadius(self.size.frameWidth / 10)
                .overlay(RoundedRectangle(cornerRadius: ((colorStyle == ColorStyle.outline) && (!isActive)) ? (self.size.frameWidth / 10) : 0).stroke(Color.bsActiveBasic, lineWidth:(colorStyle == ColorStyle.outline) && (!isActive) ? 1 : 0))
        }
    }
}


struct ButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            
            GroupButtonContainer(icon: nil, buttonItems: 4, text: "G", colorStyle: .primary, size: .giant)
            
            GroupButtonContainer(icon: Image(systemName: "star.fill"), buttonItems: 4, text: "won't read me", colorStyle: .basic, size: .large)
            
            GroupButtonContainer(icon: nil, buttonItems: 4, text: "🥑", colorStyle: .outline, size: .medium)
            
            GroupButtonContainer(icon: Image(systemName: "umbrella.fill"), buttonItems: 4, colorStyle: .primary, size: .small)
            
            GroupButtonContainer(icon: nil, buttonItems: 4, text: "T", colorStyle: .outline, size: .tiny)
            
        }
    }
}
