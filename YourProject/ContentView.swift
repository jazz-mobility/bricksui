//
//  ContentView.swift
//  BricksUI
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
