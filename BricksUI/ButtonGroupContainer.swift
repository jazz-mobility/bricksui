//
//  ButtonGroup.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import Foundation
import SwiftUI


//NOTE: THIS FILE IS NOT FINISHED
// WORK IN PROGRESS, PROTOTYPING THE FUNCTION'S ARCHITECTURE

enum SizeStyle {
    case large
    case medium
    case small
    
    var frame: CGFloat {
        switch self {
        case .large: return 90
        case .medium: return 60
        case .small: return 30
        }
    }
}

struct ButtonGroupContainer: View {
    var icon : Image?
    var buttonItems : Int
    var text: String = ""
    var color : Color
    var size : SizeStyle
    
    
    
    
    
    var body : some View {
        VStack {
            
            
            HStack(spacing: 1) {
                
                ForEach(0..<buttonItems) { i in
                    Button(action: {}, label: {
                        Group {
                            if self.icon != nil {
                                //Image(systemName: self.iconString!)
                                self.icon!
                                    .font(.system(size: self.size.frame / 2))
                                    .foregroundColor(Color.white)
                                    .frame(width: self.size.frame, height: self.size.frame)
                                    .background(self.color)
                            } else {
                                Text(self.text)
                                    .font(.system(size: self.size.frame / 2))
                                    .foregroundColor(Color.white)
                                    .frame(width: self.size.frame, height: self.size.frame)
                                    .background(self.color)
                            }
                        }
                    })
                    
                }
                //: Mark -The code below won't compile:
                // Avoid this in SwiftUI
                //            if case .active = featureState {
                //                Text("Active view!")
                //            } else {
                //                Text("Disabled view")
                //            }
                
                
            }.cornerRadius(self.size.frame / 10)
                .padding()
        }
    }
}


struct ButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            
            ButtonGroupContainer(icon: nil, buttonItems: 4, text: "S", color: Color.green, size: .small)
            ButtonGroupContainer(icon: nil, buttonItems: 4, text: "🥑", color: Color.green, size: .medium)
            ButtonGroupContainer(icon: nil, buttonItems: 4, text: "🥑", color: Color.green, size: .large)
            
            ButtonGroupContainer(icon: Image(systemName: "umbrella.fill"), buttonItems: 4, text: "X", color: .blue, size: .large)
            ButtonGroupContainer(icon: nil, buttonItems: 4, text: "M", color: .pink, size: .medium)
            ButtonGroupContainer(icon: Image(systemName: "umbrella.fill"), buttonItems: 4, text: "X", color: .blue, size: .small)
            
        }
    }
}
