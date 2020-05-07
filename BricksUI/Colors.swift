//
//  Typography.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    
    // MARK: Basic Colors
    
    /// Background Color
    static let bsBackground = Color("background")
    /// Basic Color
    static let bsBasic = Color("basic")
    /// Primary Color
    static let bsPrimary = Color("primary")
    
    // MARK: Font Colors
    
    /// Standard Font Color
    static let bsFontStd = Color("font_std")
    /// Font Hint
    static let bsFontHint = Color("font_hint")
    /// Font Disabled
    static let bsFontDisabled = Color("font_disabled")
    /// Font Button
    static let bsFontBtn = Color("font_button")
    
    // MARK: Semantic Colors
    
    /// Danger Color
    static let bsDanger = Color("danger")
    /// Info Color
    static let bsInfo = Color("info")
    /// Success Color
    static let bsSuccess = Color("success")
    /// Warning Color
    static let bsWarning = Color("warning")
    
    // MARK: State Colors
    
    /// Active State Color - Primary Style
    static let bsActivePrimary = Color("activePrimary")
    /// Active State Color - Basic Style
    static let bsActiveBasic = Color("activeBasic")
}

struct Color_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Hello, World!")
                .foregroundColor(.bsFontStd)
                .background(Color.bsBackground)
                .environment(\.colorScheme, .dark)
                .padding()
            
            Text("Hello, World!")
                .foregroundColor(.bsActivePrimary)
                .background(Color.bsActiveBasic)
                .environment(\.colorScheme, .dark)
        }
    }
    
}
