//
//  Images.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import Foundation
import SwiftUI

extension Image {
    
    //MARK: Avatars
    
    ///Turn image into a circular avatar
    func bsCircularAvatar() -> some View {
        self
            .resizable()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .padding(.all, 16)
            .aspectRatio(1.0, contentMode: .fit)
        
    }
    
    ///Turn image into a rectangular avatar
    func bsSquareAvatar() -> some View {
        self
            .resizable()
            .frame(width: 40, height: 40)
            .clipShape(Rectangle())
            .padding(.all, 16)
            .aspectRatio(1.0, contentMode: .fit)
        
    }
    ///Turn image into a rounded rectangle avatar
    func bsRoundedRectangleAvatar() -> some View {
        self
            .resizable()
            .frame(width: 40, height: 40)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding(.all, 16)
            .aspectRatio(1.0, contentMode: .fit)
        
    }
    
    //MARK: Styled Images
    
    ///Modify image to fit a circular format
    func bsCircularImage(width: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: width, height: width)
            .clipShape(Circle())
            .aspectRatio(1.0, contentMode: .fit)
    }
    
    ///Modify image to fit a square format
    func bsSquaredImage(width: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: width, height: width)
            .aspectRatio(1.0, contentMode: .fit)
    }
    
    ///Modify image to fit a rounded corners square format
    func bsRoundedRectangle(width: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: width, height: width)
            .clipShape(RoundedRectangle(cornerRadius: width/10.0))
            .aspectRatio(1.0, contentMode: .fit)
    }
    ///Modify image to have upper rounded corners in a square format
    func bs_UpperRC(imageWidth: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: imageWidth, height: imageWidth)
            .clipShape(RoundedCorner(radius: imageWidth/10.0, corners: [.topLeft, .topRight]))
    }
    
    ///Modify image to have lower rounded corners in a square format
    func bs_LowerRC(imageWidth: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: imageWidth, height: imageWidth)
            .clipShape(RoundedCorner(radius: imageWidth/10.0, corners: [.bottomLeft, .bottomRight]))
    }
    
    ///Modify image to have left-side rounded corners in a square format
    func bs_LeftRC(imageWidth: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: imageWidth, height: imageWidth)
            .clipShape(RoundedCorner(radius: imageWidth/10.0, corners: [.bottomLeft, .topLeft]))
    }
    
    ///Modify image to have right-side rounded corners in a square format
    func bs_RightRC(imageWidth: CGFloat) -> some View {
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
                Image("goldfish")
                    .bsCircularAvatar()
                Image("goldfish")
                    .bsSquareAvatar()
                Image("goldfish")
                    .bsRoundedRectangleAvatar()
                
            }.padding()
            
            HStack(spacing: 20) {
                Image("goldfish")
                    .bsCircularImage(width: 90)
                Image("goldfish")
                    .bsSquaredImage(width: 90)
                Image("goldfish")
                    .bsRoundedRectangle(width: 90)
            }.padding()
            
            HStack(spacing: 20) {
                Image("goldfish")
                    .bs_UpperRC(imageWidth: 120)
                Image("goldfish")
                    .bs_LowerRC(imageWidth: 120)
            }.padding()
            
            HStack(spacing: 20) {
                Image("goldfish")
                    .bs_LeftRC(imageWidth: 120)
                Image("goldfish")
                    .bs_RightRC(imageWidth: 120)
            }.padding()
            
            
        }
    }
}
