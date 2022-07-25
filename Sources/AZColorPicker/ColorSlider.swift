//
//  ColorSlider.swift
//  AZColorPicker
//
//  Created by Adam Zarn on 7/22/22.
//

import SwiftUI

struct ColorSlider: View {
    let color: String
    @Binding var value: Double
    @FocusState var textFieldIsFocused: Bool
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.zeroSymbol = ""
        return formatter
    }()
    
    var body: some View {
        HStack {
            Text(color).font(.headline)
            Slider(value: $value, in: 0...255) { editing in
                guard editing else { return }
                dismissKeyboard()
            }
            TextField("", value: $value, formatter: formatter)
            .focused($textFieldIsFocused)
            .font(.headline)
            .frame(width: 60)
            .keyboardType(.decimalPad)
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.center)
        }
    }
    
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil,
                                        from: nil,
                                        for: nil)
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(color: "R", value: .constant(100)).previewLayout(.sizeThatFits)
        ColorSlider(color: "G", value: .constant(150)).previewLayout(.sizeThatFits)
        ColorSlider(color: "B", value: .constant(200)).previewLayout(.sizeThatFits)
    }
}
