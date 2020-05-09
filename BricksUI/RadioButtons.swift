//
//  RadioButton.swift
//  BricksUI
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

public struct BSRadioButton: View {
    var isChecked: Bool
    var color: Color?
    var text: String = ""
    
    private var colorToUse: Color? { isEnabled ? color : .bsFontDisabled }
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    public var body: some View {
        HStack(spacing: text.isEmpty ? 0 : 6) {
            isChecked ? AnyView(CheckedButton(color: colorToUse ?? .bsPrimary)) : AnyView(UncheckedButton(color: colorToUse ?? .bsBasic))
            Text(text)
        }
    }
}

private struct CheckedButton: View {
    var color: Color = .bsPrimary
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 20, height: 20)
            Circle()
                .fill(Color.white)
                .frame(width: 18, height: 18)
            Circle()
                .fill(color)
                .frame(width: 12, height: 12)
        }
    }
}

private struct UncheckedButton: View {
    var color: Color = .bsBasic
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 20, height: 20)
            Circle()
                .fill(Color.white)
                .frame(width: 18, height: 18)
            Circle()
                .fill(color.opacity(0.1))
                .frame(width: 18, height: 18)
        }
    }
}


struct RadioButton_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack(alignment: .leading, spacing: 12) {
            BSRadioButton(isChecked: true)
            BSRadioButton(isChecked: false)
            BSRadioButton(isChecked: true).disabled(true)
            BSRadioButton(isChecked: false).disabled(true)
            BSRadioButton(isChecked: false, color: .bsDanger)
            BSRadioButton(isChecked: false, color: .bsWarning)
            BSRadioButton(isChecked: false, color: .bsSuccess)
            BSRadioButton(isChecked: true, text: "Text")
            BSRadioButton(isChecked: true, color: .bsWarning, text: "Text and custom color")
        }
    }
}
