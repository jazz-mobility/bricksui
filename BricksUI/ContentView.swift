//
//  ContentView.swift
//  BricksUI
//
//  Created by Fabio Staiano on 14/04/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
        let textField1 = myTextField.init("Gimme some text")
        let textField2 = myTextField.init("Gimme some text", style: .danger)
        
        return VStack(spacing: 20) {
            textField1
            textField2
            myTextField.init("Gimme some text", onCommit: { print("commited") })
            
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
