//
//  GridView.swift
//  BricksUI
//
//  Created by Jasveer Singh on 12.09.21.
//  Copyright © 2021 Fabio Staiano. All rights reserved.
//

import SwiftUI

struct ImageGridView: View {
    private var symbols: [String]

    init(symbols: [String]) {
        self.symbols = symbols
    }

    private var colors: [Color] = [.yellow, .purple, .green]

    //  private var sixColumnGrid: [GridItem] = Array(repeating: .init(.flexible()), count: 6)
    private var gridItemLayout = [GridItem(.adaptive(minimum: 50))]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(0 ... symbols.count, id: \.self) {
                    Image(systemName: symbols[$0 % symbols.count])
                        .font(.system(size: 30))
                        .frame(width: 50, height: 50)
                        .background(colors[$0 % colors.count])
                        .cornerRadius(10)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView(symbols: [
            "keyboard",
            "hifispeaker.fill",
            "printer.fill",
            "tv.fill",
            "desktopcomputer",
            "headphones",
            "tv.music.note",
            "mic",
            "plus.bubble",
            "video",
        ])
    }
}
