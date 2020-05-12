//
//  NavigationBars.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI


struct BsNavigatorTop: View {
    
    var title : String
    var subtitle: String
    var iconStrings : [String]
    var buttonCommits : [()->()]
    
    var body: some View {
        
        HStack {
            Group {
                Button(action:
                    self.buttonCommits[0]
                ) {
                    HStack(spacing: 0) {
                        Image(systemName: self.iconStrings[0])
                            .bsSquare(width: 24)
                            .padding(.horizontal, 4)
                    }
                }
                .buttonStyle(NavButtonStyle())
                Spacer()
                
                VStack {
                    Text(self.title).bsTypo(.h5, color: .black)
                    Text(self.subtitle).bsTypo(.p2, color: .bsBasic)
                }.offset(x: 16, y: 0)
                
                Spacer(minLength: 0)
                
                HStack(spacing: 22){
                    Button(action: self.buttonCommits[1]) {
                        Image(systemName: self.iconStrings[1])
                        .bsSquare(width: 24)
                    }
                    Button(action: self.buttonCommits[2]) {
                        Image(systemName: self.iconStrings[2])
                            .bsSquare(width: 24)
                    }
                }
                .buttonStyle(NavButtonStyle())
                .padding(.horizontal, 4)
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        .background(Color.bsBackground)
        .clipped()
        .shadow(color: Color.bsBasic, radius: 3, x: 0, y: 0)
        .animation(.default)
    }
    
}

struct NavButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.bsPrimary: Color.bsBasic)
    }
}

struct BsNavigatorTop_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack() {
            
            BsNavigatorTop(title: "BricksUI", subtitle: "A SwiftUI Design System", iconStrings: ["arrow.left", "star.fill", "star.fill"], buttonCommits: [{}, {}, {}])
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.horizontal)
        .edgesIgnoringSafeArea(.top)
    }
}

