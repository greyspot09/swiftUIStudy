//
//  SplashScreen.swift
//  SplashScreen (iOS)
//
//  Created by 宏谋刘 on 2021/6/28.
//

import SwiftUI

struct SplashScreen<Content: View, Title: View, Logo: View, NavButton: View>: View {
    var content: Content
    var titleView: Title
    var logoView: Logo
    var navButton: NavButton
    
    var imageSize: CGSize
    
    
    
    init(imageSize: CGSize,
         @ViewBuilder content: @escaping () -> Content,
         @ViewBuilder titleView: @escaping () -> Title,
         @ViewBuilder logoView: @escaping () -> Logo ,
         @ViewBuilder navButton: @escaping () -> NavButton) {
        self.content = content()
        self.titleView = titleView()
        self.logoView = logoView()
        self.navButton = navButton()
        
        self.imageSize = imageSize
    }
    
    @State var textAnimation = false
    @State var imageAnimation = false
    @State var endAnimation = false
    @State var showNavButtons = false

    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color("Purple")
                    .ignoresSafeArea()
                    .background(Color("Purple"))
                    .overlay {
                        ZStack {
                            titleView
                                .scaleEffect(endAnimation ? 0.75 : 1)
                                .offset(y: textAnimation ? -5 : 110)
                            
                            if !endAnimation {
                                logoView
                                    .matchedGeometryEffect(id: "Logo", in: animation)
                                    .frame(width: imageSize.width, height: imageSize.height)
                            }
                            
                        }
                    }
                    .overlay {
                        //Moving Right
                        HStack {
                            
                            navButton
                                .opacity(showNavButtons ? 1 : 0)
                                
                            
                            Spacer()
                            
                            if endAnimation {
                                logoView
                                    .matchedGeometryEffect(id: "Logo", in: animation)
                                    .frame(width: 30, height: 30)
                                    .padding(.trailing)
                                    .offset(y: -5)
                            }
                            
                        }
                        .padding(.horizontal)
                    }
            }
            .frame(height: endAnimation ? 60 : nil)
            .zIndex(1)
            
            content
                .frame(height: endAnimation ? nil : 0)
                .zIndex(0)
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
//        .background(Color.red)
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring()) {
                    textAnimation.toggle()
                }
                
                withAnimation(Animation.interactiveSpring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0)) {
                    endAnimation.toggle()
                }
                
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.35) {
                    withAnimation {
                        showNavButtons.toggle()
                    }
                    
                }
            }
            
        }
    }
    
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
