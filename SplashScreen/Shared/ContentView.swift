//
//  ContentView.swift
//  Shared
//
//  Created by 宏谋刘 on 2021/6/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SplashScreen(imageSize: CGSize(width: 128, height: 128)) {
            Home()
        } titleView: {
            Text("Chatty")
                .font(.system(size: 35).bold())
                .foregroundColor(.white)
        } logoView: {
            
            Image("Logo")
                .resizable()
                .aspectRatio( contentMode: .fit)
        } navButton: {
            Button {
            } label: {
                Image("profile")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
            }

        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
