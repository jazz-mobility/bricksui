//
//  NavigationBars.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI


struct BsNavigatorTop: View {
    
    var title : String
    var subtitle: String = ""
    var leftIconString: String
    var rightIconStrings : [String]
    var buttonCommits : [()->()] = [{}, {}, {}]
    
    var body: some View {
        
        HStack {
            Group {
                Button(action:
                    self.buttonCommits[0]
                ) {
                    HStack(spacing: 0) {
                        Image(systemName: self.leftIconString)
                            .bsSquare(width: 24)
                            .padding(.horizontal, 4)
                    }.foregroundColor(.black)
                }
                .buttonStyle(NavButtonStyle())
                Spacer()
                
                VStack {
                    Text(self.title).bsTypo(.h5, color: .black).offset(y: self.subtitle == "" ? 5: 0)
                    Text(self.subtitle).bsTypo(.p2, color: .bsBasic).padding(.top, self.subtitle == "" ? 0: 5)
                }
                .offset(x: 23, y: 0)
                
                Spacer()
                
                HStack(spacing: 22){
                    Button(action: self.buttonCommits[1]) {
                        Image(systemName: self.rightIconStrings[0])
                            .bsSquare(width: 24)
                    }
                    Button(action: self.buttonCommits[2]) {
                        Image(systemName: self.rightIconStrings[1])
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
            
            BsNavigatorTop(title: "BricksUI", subtitle: "A Cool Group", leftIconString: "arrow.left", rightIconStrings: ["star", "heart"])

            Spacer()
        }
        .edgesIgnoringSafeArea(.horizontal)
        .edgesIgnoringSafeArea(.top)
    }
}

