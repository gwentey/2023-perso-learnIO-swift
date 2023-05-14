//
//  AppBarView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 14/05/2023.
//

import SwiftUI

struct AppBarView: View {
    
    @Binding var show : Bool
    @Binding var selection: Int

    var body: some View {
        VStack(spacing: 25) {
            
            if self.show{
                
                HStack {
                    Text("LearnIO")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.white)
                    }

                }
                
            }
            
            HStack {
                Button(action: {
                    selection = 0
                }) {
                    VStack {
                        Text("A réviser")
                            .foregroundColor(.white)
                            .fontWeight(selection == 0 ? .bold : .none)
                        Capsule()
                            .fill(selection == 0 ? Color.white : Color.clear)
                            .frame(height: 4)
                    }
                }
                
                Button(action: {
                    selection = 1
                }) {
                    VStack {
                        Text("Apprise")
                            .foregroundColor(.white)
                            .fontWeight(selection == 1 ? .bold : .none)
                        Capsule()
                            .fill(selection == 1 ? Color.white : Color.clear)
                            .frame(height: 4)
                    }
                }
                
                Button(action: {
                    selection = 2
                }) {
                    VStack {
                        Text("Mon compte")
                            .foregroundColor(.white)
                            .fontWeight(selection == 2 ? .bold : .none)
                        Capsule()
                            .fill(selection == 2 ? Color.white : Color.clear)
                            .frame(height: 4)
                    }
                }
            }
            .padding(.bottom, 10)
        }
        .padding(.horizontal)
        .padding(.top, UIApplication
                               .shared
                               .connectedScenes
                               .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                               .first { $0.isKeyWindow }?.safeAreaInsets.top)
           .background(PaletteColorTools.one)
           .background(PaletteColorTools.one)
    }
}



class Host : UIHostingController<ContentView>{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
}

