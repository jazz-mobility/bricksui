//
//  TextField.swift
//  BricksUI
//
//  Created by Carlos Bystron on 01.05.20.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import Foundation
import SwiftUI

struct myTextField: View {
    
    enum Style {
        case defaultStyle,
             disabled,
             success,
             warning,
             danger,
             info
    }
    
    var style: Style
    var placeholder: String
    var icon: Image? = nil
    var commit: ()->() = { }
    @State private var focused: Bool = false
    @State var input: String = ""
    
    // MARK: Inits
    
    init(_ placeholder: String, onCommit: @escaping ()->() = { }) {
        self.placeholder = placeholder
        self.style = .defaultStyle
        self.commit = onCommit
    }
    
    init(_ placeholder: String, style: Style, onCommit: @escaping ()->() = { }) {
        self.placeholder = placeholder
        self.style = style
        self.commit = onCommit
    }
    
    init(_ placeholder: String, icon: Image, onCommit: @escaping ()->() = { }) {
        self.placeholder = placeholder
        self.icon = icon
        self.style = .defaultStyle
        self.commit = onCommit
    }
    
    init(_ placeholder: String, style: Style, icon: Image, onCommit: @escaping ()->() = { }) {
        self.placeholder = placeholder
        self.style = style
        self.icon = icon
        self.commit = onCommit
    }
    
    // MARK:  Function declarations
    
    fileprivate func defaultStyle() -> some View {
        HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(placeholder).foregroundColor(Colors.basic) }
                TextField("", text: $input, onEditingChanged: { (editingChanged) in
                    if editingChanged {
                        print("TextField focused")
                        self.focused = true
                    } else {
                        print("TextField focus removed")
                        self.focused = false
                    }
                }, onCommit: commit).foregroundColor(Colors.fontStd)
            }
            if focused { icon.imageScale(.large).foregroundColor(Colors.primary) }
            else { icon.imageScale(.large).foregroundColor(Colors.basic) }
        }
         .padding()
         .background(RoundedRectangle(cornerRadius: 5).foregroundColor(self.focused ? Colors.basic.opacity(0) : Colors.basic.opacity(0.1)))
         .overlay(RoundedRectangle(cornerRadius: 5).stroke(self.focused ? Colors.primary : Colors.basic.opacity(0.4), lineWidth: 1))
    }
    
    fileprivate func success() -> some View {
         HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(placeholder).foregroundColor(Colors.basic) }
                TextField("", text: $input, onEditingChanged: { (editingChanged) in
                    if editingChanged {
                        print("TextField focused")
                        self.focused = true
                    } else {
                        print("TextField focus removed")
                        self.focused = false
                    }
                }, onCommit: commit).foregroundColor(Colors.fontStd)
            }
            icon.imageScale(.large).foregroundColor(Colors.success)
         }
         .padding()
         .background(RoundedRectangle(cornerRadius: 5).foregroundColor(self.focused ? Colors.basic.opacity(0) : Colors.basic.opacity(0.1)))
         .overlay(RoundedRectangle(cornerRadius: 5).stroke(Colors.success, lineWidth: 1))
    }
    
    fileprivate func warning() -> some View {
         HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(placeholder).foregroundColor(Colors.basic) }
                TextField("", text: $input, onEditingChanged: { (editingChanged) in
                    if editingChanged {
                        print("TextField focused")
                        self.focused = true
                    } else {
                        print("TextField focus removed")
                        self.focused = false
                    }
                }, onCommit: commit).foregroundColor(Colors.fontStd)
            }
            icon.imageScale(.large).foregroundColor(Colors.warning)
         }
         .padding()
         .background(RoundedRectangle(cornerRadius: 5).foregroundColor(self.focused ? Colors.basic.opacity(0) : Colors.basic.opacity(0.1)))
         .overlay(RoundedRectangle(cornerRadius: 5).stroke(Colors.warning, lineWidth: 1))
    }
    
    fileprivate func danger() -> some View {
            HStack {
               ZStack(alignment: .leading) {
                   if input.isEmpty { Text(placeholder).foregroundColor(Colors.basic) }
                   TextField("", text: $input, onEditingChanged: { (editingChanged) in
                       if editingChanged {
                           print("TextField focused")
                           self.focused = true
                       } else {
                           print("TextField focus removed")
                           self.focused = false
                       }
                   }, onCommit: commit).foregroundColor(Colors.fontStd)
               }
               icon.imageScale(.large).foregroundColor(Colors.danger)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(self.focused ? Colors.basic.opacity(0) : Colors.basic.opacity(0.1)))
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Colors.danger, lineWidth: 1))
    }
    
    fileprivate func info() -> some View {
            HStack {
               ZStack(alignment: .leading) {
                   if input.isEmpty { Text(placeholder).foregroundColor(Colors.basic) }
                   TextField("", text: $input, onEditingChanged: { (editingChanged) in
                       if editingChanged {
                           print("TextField focused")
                           self.focused = true
                       } else {
                           print("TextField focus removed")
                           self.focused = false
                       }
                   }, onCommit: commit).foregroundColor(Colors.fontStd)
               }
               icon.imageScale(.large).foregroundColor(Colors.info)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(self.focused ? Colors.basic.opacity(0) : Colors.basic.opacity(0.1)))
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Colors.info, lineWidth: 1))
    }
    
    // MARK:  Body
    
    var body: some View {
        
        switch style {
        case .success:
            return AnyView(success())
        case .warning:
                   return AnyView(warning())
        case .danger:
                   return AnyView(danger())
        case .info:
                   return AnyView(info())
        default:
            return AnyView(defaultStyle())
        }
    }
}

// MARK: Preview

struct TextField_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack(spacing: 20) {
            myTextField.init("Thats a default Textfield", onCommit: {print("party")})
            myTextField.init("Thats a default Textfield + Icon", icon: Image(systemName: "star.fill"), onCommit: {print("party")})
            myTextField.init("Sucess", style: .success, icon: Image(systemName: "star.fill"))
            myTextField.init("Warning", style: .warning, icon: Image(systemName: "star.fill"))
            myTextField.init("Danger", style: .danger, icon: Image(systemName: "star.fill"))
            myTextField.init("Info", style: .info, icon: Image(systemName: "star.fill"))
        }
        .padding()
    }
}
