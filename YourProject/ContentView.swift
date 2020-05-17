//
//  ContentView.swift
//  BricksUI
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to BricksUI").brTypo(.h2, color: .brPrimary)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
