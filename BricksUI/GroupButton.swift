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

struct HeartButtonStyle: ButtonStyle {
    
    enum SizeStyle { case large, medium, small
        
        var frameWidth: CGFloat {
            switch self {
            case .large:
                return 56
            case .medium:
                return 48
            case .small:
                return 40
            }
        }
        
        var iconScale : CGSize {
            switch self {
            case .large:
                return CGSize(width: 40, height: 40)
            case .medium:
                return CGSize(width: 30, height: 30)
            case.small:
                return CGSize(width: 20, height: 20)
                
            }
        }
    }
    
    enum Style {case primary, basic, outline
        
        var defaultBackground : Color {
            switch self {
            case .primary:
                return Color.bsPrimary
            case .basic:
                return Color.bsBasic
            case .outline:
                return Color.white
            }
        }
        
        var activeBackground : Color {
            switch self {
            case .primary:
                return Color.bsActivePrimary
            case .basic:
                return Color.bsActiveBasic
            case .outline:
                return Color.bsPrimary
            }
        }
        
        var foregroundColor : Color {
            switch self {
            case .outline:
                return Color.black
            default:
                return Color.white
            }
        }
    }
    
    var sizesStyle : SizeStyle
    var colorStyle : Style
    var icon : Image? = nil
    var text : String = ""
    var action: ()->() = {}
    @State var isActive : Bool = false
    
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            
            .font(.largeTitle)
            .frame(width: sizesStyle.frameWidth, height: sizesStyle.frameWidth)
            .foregroundColor(colorStyle.foregroundColor)
            .background(isActive ? colorStyle.activeBackground : colorStyle.defaultBackground)
            .overlay(RoundedRectangle(cornerRadius: 4)
                .stroke(Color.gray.opacity(0.5), lineWidth: colorStyle == .outline ? 2 : 0)
        )
        // .cornerRadius(10)
    }
}



struct ButtonGroup_Previews: PreviewProvider {
    
    
    static var previews: some View {
        VStack {
            
            Button(action: {}, label:  {Image(systemName: "heart.fill")})
                .font(.largeTitle)
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
                .background(Color.black)
                .cornerRadius(10)
            
            
            
            
            Button(action : {}, label: {Text("M")})
                .buttonStyle(HeartButtonStyle(sizesStyle: .large, colorStyle: .primary, icon: Image(systemName: "heart.fill")))
            HStack(spacing: 1){
                ForEach(0..<3) {_ in
                    Button(action : {}, label: {Image(systemName: "star.fill")})
                        .buttonStyle(HeartButtonStyle(sizesStyle: .medium, colorStyle: .outline))
                }
            }.cornerRadius(10)
                .padding()
            
            HStack(spacing: 1){
                ForEach(0..<3) {_ in
                    Button(action : {}, label: {Image(systemName: "heart.fill").scaleEffect(0.75)})
                        .buttonStyle(HeartButtonStyle(sizesStyle: .small, colorStyle: .basic, icon: Image(systemName: "star.fill"), text: "hello", action: {
                            print("tapped button")
                        }))
                }
            }.cornerRadius(10)
            
            
        }
    }
}

