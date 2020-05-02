//
//  File.swift
//  BricksUI
//
//  Created by Carlos Bystron on 29.04.20.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import Foundation
import SwiftUI


struct Default : TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding()
        .background(RoundedRectangle(cornerRadius: 5).foregroundColor(Colors.basic.opacity(0.1)))
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Colors.basic.opacity(0.4), lineWidth: 1))
    }
}

struct Hover : TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding()
        .background(RoundedRectangle(cornerRadius: 5).foregroundColor(Colors.basic.opacity(0.25)))
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Colors.basic.opacity(0.4), lineWidth: 1))
    }
}

struct Disabled : TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding()
        .background(RoundedRectangle(cornerRadius: 5).foregroundColor(Colors.basic.opacity(0.07)))
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Colors.basic.opacity(0.2), lineWidth: 1))
    }
}

// MARK: Preview

struct FormElement_Previews: PreviewProvider {
  static var previews: some View {
    PreviewWrapper()
  }

  struct PreviewWrapper: View {
    @State(initialValue: "") var name: String

    var body: some View {
      VStack(spacing: 20) {
        TextField("Hello, World!", text: $name)
            .textFieldStyle(Default())
        TextField("Hello, World!", text: $name)
            .textFieldStyle(Hover())
        TextField("Hello, World!", text: $name)
            .textFieldStyle(Disabled())
      }
      .padding()
    }
  }
}
