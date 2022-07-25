//
//  AZColorPicker.swift
//  AZColorPicker
//
//  Created by Adam Zarn on 7/20/22.
//

import SwiftUI

public struct AZColorPicker: View {
    @State var color: AZColor
    let onColorChanged: ((_ color: AZColor) -> Void)?
    
    var swiftUIColor: Color {
        let roundedR = round(color.r)
        let roundedG = round(color.g)
        let roundedB = round(color.b)
        onColorChanged?(AZColor(roundedR, roundedG, roundedB))
        return Color(red: roundedR/255,
                     green: roundedG/255,
                     blue: roundedB/255,
                     opacity: 1)
    }
    
    var borderColor: Color {
        let brightness = (color.r+color.g+color.b)/(255*3)
        let gray = ((1-brightness)*255)/255
        return Color(red: gray,
                     green: gray,
                     blue: gray,
                     opacity: 1)
    }
    
    public init(initialColor: AZColor,
                onColorChanged: ((_ color: AZColor) -> Void)? = nil) {
        self.color = initialColor
        self.onColorChanged = onColorChanged
    }
    
    public var body: some View {
        VStack {
            Rectangle()
                .fill(swiftUIColor)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(borderColor, lineWidth: 1)
                )
            ColorSlider(color: "R", value: $color.r)
            ColorSlider(color: "G", value: $color.g)
            ColorSlider(color: "B", value: $color.b)
        }
        .padding()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AZColorPicker(initialColor: AZColor(0, 100, 200)).previewLayout(.sizeThatFits)
    }
}
