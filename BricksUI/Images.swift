//
//  Images.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

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
    func bsAvatarRounded() -> some View {
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
    func bsRounded(width: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: width, height: width)
            .clipShape(RoundedRectangle(cornerRadius: width/10.0))
            .aspectRatio(1.0, contentMode: .fit)
    }
    ///Modify image to have upper rounded corners in a square format
    func bsTopRounded(imageWidth: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: imageWidth, height: imageWidth)
            .clipShape(RoundedCorner(radius: imageWidth/10.0, corners: [.topLeft, .topRight]))
    }
    
    ///Modify image to have lower rounded corners in a square format
    func bsBottomRounded(imageWidth: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: imageWidth, height: imageWidth)
            .clipShape(RoundedCorner(radius: imageWidth/10.0, corners: [.bottomLeft, .bottomRight]))
    }
    
    ///Modify image to have left-side rounded corners in a square format
    func bsLeftRounded(imageWidth: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: imageWidth, height: imageWidth)
            .clipShape(RoundedCorner(radius: imageWidth/10.0, corners: [.bottomLeft, .topLeft]))
    }
    
    ///Modify image to have right-side rounded corners in a square format
    func bsRightRounded(imageWidth: CGFloat) -> some View {
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
                Image("bricks_logo")
                    .bsAvatarCircle()
                Image("bricks_logo")
                    .bsAvatarSquare()
                Image("bricks_logo")
                    .bsAvatarRounded()
                
            }.padding()
            
            HStack(spacing: 20) {
                Image("bricks_logo")
                    .bsCircle(width: 90)
                Image("bricks_logo")
                    .bsSquare(width: 90)
                Image("bricks_logo")
                    .bsRounded(width: 90)
            }.padding()
            
            HStack(spacing: 20) {
                Image("bricks_logo")
                    .bsTopRounded(imageWidth: 120)
                Image("bricks_logo")
                    .bsBottomRounded(imageWidth: 120)
            }.padding()
            
            HStack(spacing: 20) {
                Image("bricks_logo")
                    .bsLeftRounded(imageWidth: 120)
                Image("bricks_logo")
                    .bsRightRounded(imageWidth: 120)
            }.padding()
        }
    }
}
