//
//  Typography.swift
//  BricksUI
//
//  Created by Fabio Staiano on 16/04/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import Foundation
import SwiftUI


struct bsColors {
    
    // MARK: Basic Colors
    
    /// Background Color
    static let background = Color("background")
    /// Basic Color
    static let basic = Color("basic")
    /// Primary Color
    static let primary = Color("primary")
    
    // MARK: Font Colors
    
    /// Standard Font Color
    static let fontStd = Color("font_std")
    /// Font Hint
    static let fontHint = Color("font_hint")
    /// Font Disabled
    static let fontDisabled = Color("font_disabled")
    /// Font Button
    static let fontBtn = Color("font_button")
    
    // MARK: Semantic Colors
    
    /// Danger Color
    static let danger = Color("danger")
    /// Info Color
    static let info = Color("info")
    /// Success Color
    static let success = Color("success")
    /// Warning Color
    static let warning = Color("warning")
}

struct Color_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
            .foregroundColor(bsColors.fontStd)
            .background(bsColors.background)
            .environment(\.colorScheme, .dark)
    }
    
}
