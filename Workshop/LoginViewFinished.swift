
//
//  LoginView.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

struct LoginViewFinished: View {
    let placeholder1 = "Enter email"
    let placeholder2 = "Enter password"
    let placeholder3 = "Confirm password"
    let subscribe = "Subscribe to our monthly newsletter"

    var body: some View {
        VStack {
            Image("bricks_logo").brCircle(width: 180)
                .padding(.top, 40)

            VStack(spacing: 15) {
                BRTextField(self.placeholder1, style: .defaultStyle, icon: Image(systemName: "person"))
                BRTextField(self.placeholder2, style: .defaultStyle, icon: Image(systemName: "lock.open"))
                BRTextField(self.placeholder3, style: .defaultStyle, icon: Image(systemName: "lock"))
            }
            .padding()

            HStack {
                BRToggle(toggleState: false, style: .success)

                Text(self.subscribe).brTypo(.p2)
            }
            .frame(width: 350, alignment: .leading)
            .padding()

            VStack(spacing: 15) {
                BRButton(text: "Sign Up", style: .fill, action: { print("clicked on Sign Up") })
                BRButton(text: "Login", style: .outline, action: { print("clicked on Login") })
            }
            .padding()

            Spacer()
        }
    }
}

struct LoginViewFinished_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewFinished()
    }
}
