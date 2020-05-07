//
//  GroupButton+Extensions.swift
//  BricksUI
//
//  Created by Micaela Cavallo on 07/05/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import Foundation
import SwiftUI

extension GroupButtonStyle {
    enum SizeStyle { case giant, large, medium, small, tiny
        
        var frameWidth: CGFloat {
            switch self {
            case .giant:
                return 56
            case .large:
                return 48
            case .medium:
                return 40
            case .small:
                return 32
            case .tiny:
                return 24
            }
        }
        
        var iconScale : CGSize {
            switch self {
            case .giant:
                return CGSize(width: 36, height: 36)
            case .large:
                return CGSize(width: 32, height: 32)
            case .medium:
                return CGSize(width: 24, height: 24)
            case.small:
                return CGSize(width: 20, height: 20)
            case .tiny:
                return CGSize(width: 16, height: 16)
                
            }
        }
        
        var fontSize : CGFloat {
            switch self {
            case .giant:
                return 36
            case .large:
                return 32
            case .medium:
                return 24
            case.small:
                return 20
            case .tiny:
                return 16
                
            }
        }

    }
    
    enum Style { case primary, basic, outline
        
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
        
        var defaultForeground : Color {
            switch self {
            case .primary:
                return Color.white
            case .basic:
                return Color.black
            case .outline:
                return Color.bsActiveBasic
            }
        }
        
        var activeForeground : Color {
            switch self {
            case .basic:
                return Color.black
            default:
                return Color.white
            }
        }

    }
}
