//
//  ContentView.swift
//  AZColorPickerDemoApp
//
//  Created by Adam Zarn on 7/20/22.
//

import SwiftUI
import AZColorPicker

struct ContentView: View {
    @State var colorPickerIsPresented: Bool = false
    @State var color: AZColor = AZColor(0, 0, 0)
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color(red: color.r/255, green: color.g/255, blue: color.b/255))
                .frame(width: 100, height: 100)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.black, lineWidth: 1)
                )
            Text("\(round(color.r))".split(separator: ".").first ?? "")
            Text("\(round(color.g))".split(separator: ".").first ?? "")
            Text("\(round(color.b))".split(separator: ".").first ?? "")
            Spacer().frame(height: 20)
            Button(action: {
                colorPickerIsPresented = true
            }, label: {
                Text("Open Color Picker")
            })
        }
        .sheet(isPresented: $colorPickerIsPresented) {
            AZColorPicker(initialColor: color, onColorChanged: { color in
                self.color = color
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
