//
//  ArchitectureView.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

struct BuildingsViewFinished: View {
    
    let text = "The Sydney Opera House is a multi-venue performing arts centre at Sydney Harbour in Sydney, New South Wales, Australia. It is one of the 20th century's most famous and distinctive buildings."
    
    var body: some View {
        
        VStack(alignment: .leading) {
            BRNavigatorTop(title: "Architecture", subtitle: "", leftIconString: "arrow.left", rightIconStrings: ["calendar", "heart"])
            
            ScrollView {
                BRCard(image: Image("1"), title: "Sydney Opera House", subtitle: "", text: text, caption: "#ArtHouse").padding()
                
                Divider()
                
                Text("You might also like:").brTypo(.h6, color: .brBasic)
                    .padding(.horizontal, 20)
                
                ScrollView(.horizontal) {
                    
                    HStack(spacing: 15) {
                        Image("2").brRounded(width: 90)
                        Image("3").brRounded(width: 90)
                        Image("4").brRounded(width: 90)
                        Image("5").brRounded(width: 90)
                        Image("2").brRounded(width: 90)
                        
                    }.padding(15)
                }
                .background(Color.brBasic.opacity(0.2))
            }
            
            BRNavigatorBottom(index: 1, icons: ["house", "map", "magnifyingglass", "person"])
            
        }.edgesIgnoringSafeArea(.vertical)
    }
}

struct BuildingsViewFinished_Previews: PreviewProvider {
    static var previews: some View {
        BuildingsViewFinished()
    }
}
