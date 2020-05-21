
//
//  LoginView.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    let placeholder1 = "Enter email"
    let placeholder2 = "Enter password"
    let placeholder3 = "Confirm password"
    let subscribe = "Subscribe to our monthly newsletter"
    
    
    var body: some View {
        VStack {
            Text("Welcome to BricksUI").brTypo(.h2, color: .brPrimary)
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
