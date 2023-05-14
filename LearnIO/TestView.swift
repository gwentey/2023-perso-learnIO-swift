//
//  TestView.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 13/05/2023.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        
        Home()
    }
}

struct Home : View {
    
    @State var index = 0
    @State var show = false
    
    var body : some View{
        
        VStack(spacing: 0){
            
            appBar(index: self.$index,show: self.$show)
            
            ZStack{
                
                Chats(show: self.$show).opacity(self.index == 0 ? 1 : 0)
                
                Status().opacity(self.index == 1 ? 1 : 0)
                
                Calls().opacity(self.index == 2 ? 1 : 0)
            }

            
        }.edgesIgnoringSafeArea(.top)
    }
}

struct appBar : View {
    
    @Binding var index : Int
    @Binding var show : Bool
    
    var body : some View{
        
        VStack(spacing: 25){
            
            if self.show{
                
                HStack{
                    
                    Text("SwiftUI")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                    }) {
                        
                        Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.white)
                    }
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("menu")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.white)
                        
                    }.padding(.leading)
                }
            }
            
            HStack{
                
                Button(action: {
                    
                    self.index = 0
                    
                }) {
                    
                    VStack{
                        
                        Text("A réviser")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 0 ? .bold : .none)
                        
                        Capsule().fill(self.index == 0 ? Color.white : Color.clear)
                        .frame(height: 4)
                    }
                }
                
                Button(action: {
                    
                    self.index = 1
                    
                }) {
                    
                    VStack{
                        
                        Text("Apprise")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 1 ? .bold : .none)
                        
                        Capsule().fill(self.index == 1 ? Color.white : Color.clear)
                        .frame(height: 4)
                    }
                }
                
                Button(action: {
                    
                    self.index = 2
                    
                }) {
                    
                    VStack{
                        
                        Text("Mon compte")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 2 ? .bold : .none)
                        
                        Capsule().fill(self.index == 2 ? Color.white : Color.clear)
                        .frame(height: 4)
                    }
                }
                
            }.padding(.bottom, 10)
            
            
        }.padding(.horizontal)
            .padding(.top, UIApplication
                                .shared
                                .connectedScenes
                                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                                .first { $0.isKeyWindow }?.safeAreaInsets.top)
            .background(PaletteColorTools.one)
    }
}

struct Chats : View {
    
    @Binding var show : Bool
    
    var body : some View{
        
        List(0...25,id: \.self){i in
            
            if i == 0{
                
                CellView()
                .onAppear {
                       
                    withAnimation {
                        
                        self.show = true
                    }
                    
                }
                .onDisappear {
                    
                    withAnimation {
                        
                        self.show = false
                    }
                }
            }
            else{
                
               CellView()
            }
            
        }
    }
}

struct CellView : View {
    
    var body : some View{
        
        HStack{
            
            Image("profile1")
            .resizable()
            .frame(width: 55, height: 55)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Elisa")
                
                Text("Msg").font(.caption)
            }
        }
        .padding(.vertical, 4)
    }
}

struct Status : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Text("Status")
            }
        }
    }
}

struct Calls : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Text("Calls")
            }
        }
    }
}

class Host : UIHostingController<ContentView>{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
