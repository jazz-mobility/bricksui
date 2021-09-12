//
//  ArchitectureView.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

struct BuildingsView: View {
    let text = "The Sydney Opera House is a multi-venue performing arts centre at Sydney Harbour in Sydney, New South Wales, Australia. It is one of the 20th century's most famous and distinctive buildings."

    var body: some View {
        VStack(alignment: .leading) {
            Spacer(minLength: 300)
            ScrollView {
                Text("Welcome to BricksUI").brTypo(.h2, color: .brPrimary)
            }
        }
    }
}

struct BuildingsView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingsView()
    }
}
