//
//  ContentView.swift
//  SidePanel
//
//  Created by Yan Moroz on 01.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentView = MainViews.home
    @State private var showSideMenu = false
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    SideMenu(currentView: $currentView, showSideMenu: $showSideMenu)
                }
                .padding(.top, 25)
                .padding(.horizontal, 20)
                
                Spacer(minLength: 0)
            }
            
            VStack(spacing: 0) {
                Header()
                
                currentView.view
                    .shadow(radius: 20)
            }
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: self.showSideMenu ? 30 : 0))
            .scaleEffect(self.showSideMenu ? 0.9 : 1)
            .offset(x: self.showSideMenu ? UIScreen.main.bounds.width / 2 : 0,
                    y: self.showSideMenu ? 15 : 0)
            .rotationEffect(.init(degrees: self.showSideMenu ? -5 : 0))
        }
        .shadow(radius: 20)
        .ignoresSafeArea(edges: .bottom)
        .background(self.showSideMenu ? .white : .black)
    }
    
    @ViewBuilder
    private func Header() -> some View {
        HStack(spacing: 15) {
            Button {
                withAnimation {
                    self.showSideMenu.toggle()
                }
            } label: {
                Image(systemName: self.showSideMenu ? "xmark" : "line.horizontal.3")
                    .resizable()
                    .frame(width: self.showSideMenu ? 18 : 22, height: 18)
                    .foregroundStyle(.white)
            }
            
            Text(self.currentView.title)
                .font(.title)
                .foregroundStyle(.white)
            
            Spacer(minLength: 0)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
