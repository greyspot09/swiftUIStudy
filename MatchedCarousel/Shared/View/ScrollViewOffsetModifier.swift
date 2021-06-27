//
//  ScrollViewOffsetModifier.swift
//  MatchedCarousel
//
//  Created by 宏谋刘 on 2021/6/24.
//

import SwiftUI

struct ScrollViewOffsetModifier: ViewModifier {
    var anchorPoint: Anchor = .top
    @Binding var offset: CGFloat
    
    func body(content: Content)-> some View {
        content
            .overlay(
                GeometryReader { proxy -> Color in
                let frame = proxy.frame(in: .global)
                DispatchQueue.main.async {
                    switch anchorPoint {
                    case .top:
                        offset = frame.minY
                    case .bottom:
                        offset = frame.maxY
                    case .leading:
                        offset = frame.minX
                    case .trailing:
                        offset = frame.maxX
                    }
                }
                    return Color.clear
                }
            )
    }
}

enum Anchor {
    case top
    case bottom
    case leading
    case trailing
}


