//
//  NavigatorsBottom.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

struct BRNavigatorBottom : View {
    
    @State var index : Int
    var icons: [String]
    //var text : [String]? = [""]
    
    var body : some View {
        
        GeometryReader { g in
            HStack(spacing: 0) {
                return self.makeTabs(totalWidth: g.size.width)
            }
        }.frame(height: 56)
    }
    
    func makeTabs(totalWidth: CGFloat) -> some View {
        HStack(spacing: 0) {
            ForEach(0..<icons.count) { i in
                
                Button(action: {self.index = i}, label: {
                    VStack {
                        Rectangle().frame(height: 4).foregroundColor(self.index == i ? Color.brPrimary : Color.clear)
                        Image(systemName: self.icons[i])
                            .brSquare(width: self.index == i ? 24 : 21)
                            .foregroundColor(self.index == i ? Color.brPrimary : Color.brFontDisabled)
                            .padding(.bottom, 24)
                            .padding(.top, 10)
                    }
                    .background(Color.brBackground)
                    .frame(width: totalWidth / CGFloat(self.icons.count))
                    .animation(.easeOut(duration: 0.35))
                })
            }
        }
    }
}


struct BRNavigatorBottom_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ZStack {Color.brPrimary.opacity(0.4)}
            
            BRNavigatorBottom(index: 0, icons: ["house.fill", "magnifyingglass", "heart.fill", "person.fill"])
        }
        .edgesIgnoringSafeArea(.all)
    }
}
