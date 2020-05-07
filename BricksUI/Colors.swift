//
//  Typography.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

extension Color {
    
    // MARK: Basic Colors
    
    static let bsBackground = Color("background")
    static let bsBasic = Color("basic")
    static let bsPrimary = Color("primary")
    
    // MARK: Font Colors
    
    /// Standard Font Color
    static let bsFontStd = Color("font_std")
    /// Hint Font Color
    static let bsFontHint = Color("font_hint")
    /// Disabled Font Color
    static let bsFontDisabled = Color("font_disabled")
    /// Button Font Color
    static let bsFontBtn = Color("font_button")
    
    // MARK: Semantic Colors
    
    static let bsDanger = Color("danger")
    static let bsInfo = Color("info")
    static let bsSuccess = Color("success")
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
