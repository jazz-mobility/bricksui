//
//  Typography.swift
//  BricksUI
//
//  Created by Fabio Staiano on 16/04/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import SwiftUI

struct BSTypography: ViewModifier {
    
    enum Style {
        
        /// Titles
        case h1, h2, h3, h4, h5, h6
        
        /// Subtitles
        case s1, s2
        
        /// Paragraphs
        case p1, p2
        
        /// Captions
        case c1, c2
    }
    
    var style: Style
    
    func body(content: Content) -> some View {
        switch style {
        case .h1: return content
            .font(.system(size: 36, weight: .bold))
        case .h2: return content
            .font(.system(size: 32, weight: .bold))
        case .h3: return content
            .font(.system(size: 30, weight: .bold))
        case .h4: return content
            .font(.system(size: 26, weight: .bold))
        case .h5: return content
            .font(.system(size: 22, weight: .bold))
        case .h6: return content
            .font(.system(size: 18, weight: .bold))
        case .s1: return content
            .font(.system(size: 15, weight: .semibold))
        case .s2: return content
            .font(.system(size: 13, weight: .semibold))
        case .p1: return content
            .font(.system(size: 15, weight: .regular))
        case .p2: return content
            .font(.system(size: 13, weight: .regular))
        case .c1: return content
            .font(.system(size: 12, weight: .regular))
        case .c2: return content
            .font(.system(size: 12, weight: .bold))
        }
    }
}

extension View {
    func bsTypo(_ style: BSTypography.Style, color: Color = .bsFontStd) -> some View {
        self
            .modifier(BSTypography(style: style))
            .foregroundColor(color)
    }
}


struct Typography_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            Group {
                Text("Typography h1").bsTypo(.h1, color: .blue)
                Text("Typography h1").bsTypo(.h1, color: .green)
                Text("Typography h1").bsTypo(.h1, color: .pink)
            
                Text("Typography h1").bsTypo(.h1)
                Text("Typography h2").bsTypo(.h2)
                Text("Typography h3").bsTypo(.h3)
                Text("Typography h4").bsTypo(.h4)
                Text("Typography h5").bsTypo(.h5)
                Text("Typography h6").bsTypo(.h6)
            }
            Group {
                Text("Typography h1").bsTypo(.s1)
                Text("Typography h2").bsTypo(.s2)
                
                Text("Typography p1").bsTypo(.p1)
                Text("Typography p2").bsTypo(.p2)
                
                Text("Typography c1").bsTypo(.c1)
                Text("Typography c2").bsTypo(.c2)
            }
        }
    }
}
