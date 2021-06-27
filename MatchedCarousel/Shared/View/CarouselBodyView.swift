//
//  CarouselBodyView.swift
//  MatchedCarousel
//
//  Created by 宏谋刘 on 2021/6/24.
//

import SwiftUI

struct CarouselBodyView: View {
    var index: Int
    @State var offset: CGFloat = 0
    
    var body: some View {
        
        GeometryReader {
            proxy in
            let size = proxy.size
            
            ZStack {
                Image("p\(index)")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: size.width - 8, height: size.height/1.2)
                    .cornerRadius(12)
                
                VStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Human Integration Supervisor")
                            .font(.title2.bold())
                            .kerning(1.5)
                        
                        Text("your score would be 2 because you’d have scored a match (and no penalty would be incurred for the flips involving")
                            .kerning(1.2)
                        .foregroundStyle(.secondary)
                    }
                    .foregroundStyle(.white)
                    .padding(.top)
                    
                    Spacer(minLength: 0)
                    
                    VStack(
                        alignment:.leading,
                           spacing: 25){
                        HStack(spacing: 15) {
                            Image(systemName: "person.2.circle")
                                .resizable()
                                .frame(width: 55, height: 55)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text("iJustine")
                                    .font(.title2.bold())
                                
                                Text("Apple Sheep")
                                    .foregroundStyle(.secondary)
                            }
                            .foregroundStyle(.black)
                        }
                        
                        HStack {
                            VStack {
                                Text("1203")
                                    .font(.title.bold())
                                
                                Text("Posts")
                                    .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack {
                                Text("3103")
                                    .font(.title.bold())
                                
                                Text("Followers")
                                    .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack {
                                Text("1203")
                                    .font(.title.bold())
                                
                                Text("Posts")
                                    .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .foregroundStyle(.black)
                    }
                    .padding(20)
                    .padding(.horizontal, 10)
                    .background(.white, in: RoundedRectangle(cornerRadius: 4))
                }
                .padding(20)
                
                
            }
            .frame(width: size.width - 8, height: size.height/1.2)
            .frame(width: size.width, height: size.height)
        }
        .tag("p\(index)")
        .rotation3DEffect(
            .init(degrees: getProgress() * 90),
            axis: (x: 0, y: 1, z: 0),
            anchor: offset > 0  ? .leading : .trailing,
            anchorZ: 0,
            perspective: 0)
        .modifier(ScrollViewOffsetModifier(anchorPoint: .leading, offset: $offset))
        .overlay(Text("\(offset)").foregroundColor(.red))

        
    }
    
    func getProgress() -> CGFloat {
        let progress = -offset/UIScreen.main.bounds.width
        return progress
    }
}

struct CarouselBodyView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
