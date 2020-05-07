//
//  ButtonGroup.swift
//  BricksUI
//
//  Created by Micaela Cavallo on 06/05/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import Foundation
import SwiftUI


enum ButtonSizes { case large, medium, small}
enum ColorStyles { case primary, basic, outline}

struct GroupButtonStyle: ButtonStyle {
    
    var sizesStyle : SizeStyle
    var colorStyle : Style
    var icon : Image? = nil
    var text : String = ""
    var action: ()->() = {}
    @State var isActive : Bool = true
    
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            
            .font(.system(size: sizesStyle.fontSize, weight: .bold))
            .frame(width: sizesStyle.frameWidth, height: sizesStyle.frameWidth)
            .foregroundColor(isActive ? colorStyle.activeForeground : colorStyle.defaultForeground)
            .background(isActive ? colorStyle.activeBackground : colorStyle.defaultBackground)
            .border(Color.black, width: 1)
    }
}



struct ButtonGroup_Previews: PreviewProvider {
    
    
    static var previews: some View {
        VStack {
            
            // must apply size for icon and text in the makeGroup logic
            HStack {
                Button(action : {}, label: {Text("G")})
                    .buttonStyle(GroupButtonStyle(sizesStyle: .giant, colorStyle: .primary ))
                
                Button(action : {}, label: {Text("L")})
                    .buttonStyle(GroupButtonStyle(sizesStyle: .large, colorStyle: .basic ))
                Button(action : {}, label: {Text("M")})
                    .buttonStyle(GroupButtonStyle(sizesStyle: .medium, colorStyle: .primary ))
                
                Button(action : {}, label: {Text("S")})
                    .buttonStyle(GroupButtonStyle(sizesStyle: .small, colorStyle: .basic ))
                Button(action : {}, label: {Text("T")})
                    .buttonStyle(GroupButtonStyle(sizesStyle: .tiny, colorStyle: .primary ))
                
            }
            
            HStack(spacing: 2){
                ForEach(0..<3) {_ in
                    Button(action : {}, label: {Image(systemName: "star.fill")})
                        .buttonStyle(GroupButtonStyle(sizesStyle: .giant, colorStyle: .outline))
                }
            }
                
            HStack(spacing: 2){
                ForEach(0..<3) {_ in
                    Button(action : {}, label: {Image(systemName: "star.fill")})
                        .buttonStyle(GroupButtonStyle(sizesStyle: .medium, colorStyle: .primary))
                }
            }
            HStack(spacing: 2){
                ForEach(0..<3) {_ in
                    Button(action : {}, label: {Image(systemName: "star.fill")})
                        .buttonStyle(GroupButtonStyle(sizesStyle: .tiny, colorStyle: .basic))
                }
            }

//            .cornerRadius(5)
//            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
            
        }
    }
}

