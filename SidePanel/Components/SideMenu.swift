//
//  SideMenu.swift
//  SidePanel
//
//  Created by Yan Moroz on 01.02.2024.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var currentView: MainViews
    @Binding var showSideMenu: Bool
    
    var body: some View {
        SideMenuHeader()
        
        VStack(alignment: .leading) {
            SideMenuListButton(text: "Catalog", icon: "catalogue", view: .home)
            SideMenuListButton(text: "Cart", icon: "cart", view: .cart)
            SideMenuListButton(text: "Favorites", icon: "favorite", view: .favorites)
            SideMenuListButton(text: "Your Orders", icon: "orders", view: .orders)
        }
        
        Divider()
            .frame(width: 150, height: 1)
            .background(.black)
            .padding(.vertical, 30)
        
        LogoutButton()
        
        Spacer()
    }
    
    @ViewBuilder
    private func SideMenuListButton(text: String, icon: String, view: MainViews) -> some View {
        Button {
            withAnimation {
                self.currentView = view
                self.showSideMenu.toggle()
            }
        } label: {
            HStack(spacing: 15) {
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .colorMultiply(self.currentView == view ? .yellow : .black)
                
                Text(text)
                    .bold(self.currentView == view)
                    .foregroundStyle(self.currentView == view ? .yellow : .black)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(self.currentView == view ? .black : .clear)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    @ViewBuilder
    private func SideMenuHeader() -> some View {
        Image("profile")
            .resizable()
            .frame(width: 100, height: 100)
            .colorInvert()
        
        Text("Hey")
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.black)
            .padding(.top, 10)
        
        Text("Catherine")
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.black)
    }
    
    @ViewBuilder
    private func LogoutButton() -> some View {
        Button {
            
        } label: {
            HStack(spacing: 25) {
                Image("logout")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .colorMultiply(.black)
                
                Text("Sign Out")
                    .foregroundStyle(.black)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
        }
    }
}

#Preview {
    SideMenu(currentView: .constant(MainViews.home), showSideMenu: .constant(false))
}
