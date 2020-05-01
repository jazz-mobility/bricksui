//
//  RoundedCorner.swift
//  BricksUI
//
//  Created by Micaela Cavallo on 01/05/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import Foundation
import SwiftUI

// Custom shape with independently rounded corners

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
