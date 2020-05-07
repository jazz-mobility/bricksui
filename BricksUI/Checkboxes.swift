//
//  Toggles.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI


// STILL WORKING ON IT - NOT FINISHED


public struct CheckboxToggleStyle: ToggleStyle {
    public func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 22, height: 22)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}


struct BSCheckboxPrimary: View {
    @State private var toggleState: Bool = true
    
    var body: some View {
        VStack{
            Toggle("", isOn: $toggleState)
                .toggleStyle(CheckboxToggleStyle())
        }
    
    }
}


struct Checkboxes_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            BSCheckboxPrimary()
        }
    }
}
