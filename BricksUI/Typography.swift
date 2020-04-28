//
//  Typography.swift
//  BricksUI
//
//  Created by Fabio Staiano on 16/04/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import Foundation
import SwiftUI

extension Text {

    enum Style {
        case h1, h2, h3, h4, h5, h6, // Titles
             s1, s2, // Subtitles
             p1, p2, // Paragraphs
             c1, c2  // Captions
    }

    func typo(_ style: Style) -> Text {
        switch style {
        case .h1:
            return
                foregroundColor(Colors.fontStd)
            .font(.system(size: 36))
            .fontWeight(.bold)
        case .h2:
            return
                foregroundColor(Colors.fontStd)
            .font(.system(size: 32))
            .fontWeight(.bold)
        case .h3:
            return
                foregroundColor(Colors.fontStd)
            .font(.system(size: 30))
            .fontWeight(.bold)
        case .h4:
            return
                foregroundColor(Colors.fontStd)
            .font(.system(size: 26))
            .fontWeight(.bold)
        case .h5:
            return
                foregroundColor(Colors.fontStd)
            .font(.system(size: 22))
            .fontWeight(.bold)
        case .h6:
            return
                foregroundColor(Colors.fontStd)
            .font(.system(size: 18))
            .fontWeight(.bold)
        case .s1:
            return
                foregroundColor(Colors.fontStd)
            .font(.system(size: 15))
            .fontWeight(.semibold)
        case .s2:
            return
                foregroundColor(Colors.fontStd)
            .font(.system(size: 13))
            .fontWeight(.semibold)
        case .p1:
            return
                foregroundColor(Colors.primary)
            .font(.system(size: 15))
            .fontWeight(.regular)
        case .p2:
            return
                foregroundColor(Colors.fontStd)
            .font(.system(size: 13))
            .fontWeight(.regular)
        case .c1:
            return
                foregroundColor(Colors.fontStd)
            .font(.system(size: 12))
            .fontWeight(.regular)
        case .c2:
            return
                foregroundColor(Colors.fontStd)
            .font(.system(size: 12))
            .fontWeight(.bold)
        }
    }
}

struct Typography_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/.typo(.h1)
    }
}
