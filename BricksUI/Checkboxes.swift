//
//  Toggles.swift
//  BricksUI
//
//  Created by Fabio Staiano on 03/05/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import SwiftUI


// STILL WORKING ON IT - NOT FINISHED


struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
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


struct bsCheckboxPrimary: View {
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
            bsCheckboxPrimary()
        }
    }
}
