//
//  Images.swift
//  BricksUI
//
//  Created by Micaela Cavallo on 01/05/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import Foundation
import SwiftUI

extension Image {
    ///Turn image into a circular avatar
    func BSCircularAvatar() -> some View {
        self
            .resizable()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .padding(.all, 16)
            .aspectRatio(1.0, contentMode: .fit)
            
   }
    
    ///Turn image into a rectangular avatar
    func BSRectangularAvatar() -> some View {
         self
             .resizable()
             .frame(width: 40, height: 40)
             .clipShape(Rectangle())
             .padding(.all, 16)
             .aspectRatio(1.0, contentMode: .fit)
             
    }
    ///Turn image into a rounded rectangle avatar
    func BSRoundedRectangleAvatar() -> some View {
         self
             .resizable()
             .frame(width: 40, height: 40)
             .clipShape(RoundedRectangle(cornerRadius: 5))
             .padding(.all, 16)
             .aspectRatio(1.0, contentMode: .fit)
             
    }
}
