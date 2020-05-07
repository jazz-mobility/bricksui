//
//  ContentView.swift
//  BricksUI
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to BricksUI").bsTypo(.h2, color: .bsPrimary)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
