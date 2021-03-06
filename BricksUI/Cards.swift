//
//  Cards.swift
//  BricksUI
//
//  Created by Samuel Kebis on 11/05/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import SwiftUI

struct BRCard: View {
    var image: Image? = nil
    var title: String
    var subtitle: String = ""
    var text: String
    var caption: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            image?
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(title)
                .brTypo(.h6)
                .padding(.horizontal)
                .padding(.top, 14)
                .padding(.bottom, 6)
            if !subtitle.isEmpty {
                Text(subtitle)
                    .brTypo(.s2)
                    .padding(.horizontal)
            }
            Divider()
                .padding(.vertical, 16)
            Text(text)
                .brTypo(.p1)
                .opacity(0.8)
                .padding(.horizontal)
            if !caption.isEmpty {
                Divider()
                    .padding(.vertical, 16)
                Text(caption)
                    .brTypo(.c2)
                    .padding(.horizontal)
            }
        }
    }
}

struct Cards_Previews: PreviewProvider {
    static let img = Image("bricks_banner")
    static let text = "A nebula is an interstellar cloud of dust, hydrogen, helium and other ionized gases. Originally, nebula was a name for any diffuse astronomical object, including galaxies beyond the Milky Way."
    
    static var previews: some View {
        Group {
            BRCard(image: img, title: "Title", subtitle: "Subtitle", text: text, caption: "Caption")
            BRCard(image: img, title: "Title", subtitle: "Subtitle", text: text)
            BRCard(title: "Title", subtitle: "Subtitle", text: text)
            BRCard(title: "Title", text: text)
        }
        .previewLayout(.fixed(width: 300, height: 330))
    }
}
