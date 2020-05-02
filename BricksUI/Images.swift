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
    
    //MARK: Avatars
    
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
    func BSSquareAvatar() -> some View {
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
    
    //MARK: Styled Images
    
    ///Modify image to fit a circular format
    func BSCircularImage(width: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: width, height: width)
            .clipShape(Circle())
            .aspectRatio(1.0, contentMode: .fit)
    }
    
    ///Modify image to fit a square format
    func BSSquaredImage(width: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: width, height: width)
            .aspectRatio(1.0, contentMode: .fit)
    }
    
    ///Modify image to fit a rounded corners square format
    func BSRoundedRectangle(width: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: width, height: width)
            .clipShape(RoundedRectangle(cornerRadius: width/10.0))
            .aspectRatio(1.0, contentMode: .fit)
    }
    ///Modify image to have upper rounded corners in a square format
    func BS_UpperRC(imageWidth: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: imageWidth, height: imageWidth)
            .clipShape(RoundedCorner(radius: imageWidth/10.0, corners: [.topLeft, .topRight]))
    }
    
    ///Modify image to have lower rounded corners in a square format
    func BS_LowerRC(imageWidth: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: imageWidth, height: imageWidth)
            .clipShape(RoundedCorner(radius: imageWidth/10.0, corners: [.bottomLeft, .bottomRight]))
    }
    
    ///Modify image to have left-side rounded corners in a square format
    func BS_LeftRC(imageWidth: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: imageWidth, height: imageWidth)
            .clipShape(RoundedCorner(radius: imageWidth/10.0, corners: [.bottomLeft, .topLeft]))
    }
    
    ///Modify image to have right-side rounded corners in a square format
    func BS_RightRC(imageWidth: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: imageWidth, height: imageWidth)
            .clipShape(RoundedCorner(radius: imageWidth/10.0, corners: [.bottomRight, .topRight]))
    }
    

}


struct Images_Previews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                Image("paris")
                    .BSCircularAvatar()
                Image("paris")
                    .BSSquareAvatar()
                Image("paris")
                    .BSRoundedRectangleAvatar()
                
            }.padding()
            
            HStack(spacing: 20) {
                Image("paris")
                    .BSCircularImage(width: 80)
                Image("paris")
                    .BSSquaredImage(width: 80)
                Image("paris")
                    .BSRoundedRectangle(width: 80)
            }.padding()
            
            HStack(spacing: 20) {
                Image("paris")
                    .BS_UpperRC(imageWidth: 80)
                Image("paris")
                    .BS_LowerRC(imageWidth: 80)
                Image("paris")
                    .BS_LeftRC(imageWidth: 80)
                Image("paris")
                    .BS_RightRC(imageWidth: 80)
            }.padding()
        }
    }
}
