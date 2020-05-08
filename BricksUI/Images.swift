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
    func bsAvatarCircle() -> some View {
        self
            .resizable()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .padding(.all, 16)
            .aspectRatio(1.0, contentMode: .fit)
        
    }
    
    ///Turn image into a rectangular avatar
    func bsAvatarSquare() -> some View {
        self
            .resizable()
            .frame(width: 40, height: 40)
            .clipShape(Rectangle())
            .padding(.all, 16)
            .aspectRatio(1.0, contentMode: .fit)
        
    }
    ///Turn image into a rounded rectangle avatar
    func bsAvatarRoundedSquare() -> some View {
        self
            .resizable()
            .frame(width: 40, height: 40)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding(.all, 16)
            .aspectRatio(1.0, contentMode: .fit)
        
    }
    
    //MARK: Styled Images
    
    ///Modify image to fit a circular format
    func bsCircle(width: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: width, height: width)
            .clipShape(Circle())
            .aspectRatio(1.0, contentMode: .fit)
    }
    
    ///Modify image to fit a square format
    func bsSquare(width: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: width, height: width)
            .aspectRatio(1.0, contentMode: .fit)
    }
    
    ///Modify image to fit a rounded corners square format
    func bsRoundedCorners(width: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: width, height: width)
            .clipShape(RoundedRectangle(cornerRadius: width/10.0))
            .aspectRatio(1.0, contentMode: .fit)
    }
    ///Modify image to have upper rounded corners in a square format
    func bsTopRoundedCorners(imageWidth: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: imageWidth, height: imageWidth)
            .clipShape(RoundedCorner(radius: imageWidth/10.0, corners: [.topLeft, .topRight]))
    }
    
    ///Modify image to have lower rounded corners in a square format
    func bsBottomRoundedCorners(imageWidth: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: imageWidth, height: imageWidth)
            .clipShape(RoundedCorner(radius: imageWidth/10.0, corners: [.bottomLeft, .bottomRight]))
    }
    
    ///Modify image to have left-side rounded corners in a square format
    func bsLeftRoundedCorners(imageWidth: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: imageWidth, height: imageWidth)
            .clipShape(RoundedCorner(radius: imageWidth/10.0, corners: [.bottomLeft, .topLeft]))
    }
    
    ///Modify image to have right-side rounded corners in a square format
    func bsRightRoundedCorners(imageWidth: CGFloat) -> some View {
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
                    .bsAvatarCircle()
                Image("goldfish")
                    .bsAvatarSquare()
                Image("goldfish")
                    .bsAvatarRoundedSquare()
                
            }.padding()
            
            HStack(spacing: 20) {
                Image("goldfish")
                    .bsCircle(width: 90)
                Image("goldfish")
                    .bsSquare(width: 90)
                Image("goldfish")
                    .bsRoundedCorners(width: 90)
            }.padding()
            
            HStack(spacing: 20) {
                Image("goldfish")
                    .bsTopRoundedCorners(imageWidth: 120)
                Image("goldfish")
                    .bsBottomRoundedCorners(imageWidth: 120)
            }.padding()
            
            HStack(spacing: 20) {
                Image("goldfish")
                    .bsLeftRoundedCorners(imageWidth: 120)
                Image("goldfish")
                    .bsRightRoundedCorners(imageWidth: 120)
            }.padding()
            
            
        }
    }
}
