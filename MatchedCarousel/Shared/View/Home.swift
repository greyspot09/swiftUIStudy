//
//  Home.swift
//  MatchedCarousel
//
//  Created by 宏谋刘 on 2021/6/24.
//

import SwiftUI

struct Home: View {
    @State var currentTab = "p1"
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                let size = proxy.size
                
                Image(currentTab)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(1)
            }
            .ignoresSafeArea()
            .overlay(.ultraThinMaterial)
            .colorScheme(.dark)
            
            TabView(selection: $currentTab) {
                ForEach(1...7,
                        id:\.self
                ) { index in
                    CarouselBodyView(index: index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
