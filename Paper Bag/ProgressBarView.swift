//
//  ProgressBarView.swift
//  Paper Bag
//
//  Created by Christian Mejillano on 23/1/2024.
//

import SwiftUI

struct ProgressBarView: View {
    var value: Float
    var color: Color
    var label: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.caption)
                .foregroundColor(Color.black)
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle().frame(width: geometry.size.width, height: 5)
                        .opacity(0.3)
                        .foregroundColor(Color(UIColor.systemTeal))
                    
                    Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: 5)
                        .foregroundColor(color)
                        .animation(.linear, value: value)
                }.cornerRadius(45.0)
            }
        }
    }
}
