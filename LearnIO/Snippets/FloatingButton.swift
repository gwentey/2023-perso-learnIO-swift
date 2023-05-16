//
//  FloatingButton.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 15/05/2023.
//

import Foundation
import SwiftUI

// floating button to CreerUneListeView
struct FloatingButton: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var show: Bool
    @Binding var choice: Int
    
    var body: some View {
        
        if choice == 0 || choice == 1 {
            NavigationLink {
                CreerUneListeView()
                    .environment(\.managedObjectContext, viewContext)
                    .navigationBarHidden(true)

            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(PaletteColorTools.one)
                    .cornerRadius(30)
                    .shadow(color: PaletteColorTools.two, radius: 10, x: 0, y: 5)
            }
        }
    }
}
