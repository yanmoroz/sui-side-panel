//
//  MainViews.swift
//  SidePanel
//
//  Created by Yan Moroz on 01.02.2024.
//

import SwiftUI

enum MainViews: Int, RawRepresentable {
    case home
    case cart
    case favorites
    case orders
    
    init?(rawValue: Int) {
        switch rawValue {
        case 0: self = .home
        case 1: self = .cart
        case 2: self = .favorites
        case 3: self = .orders
        default: return nil
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .cart: return "Cart"
        case .favorites: return "Favorites"
        case .orders: return "Orders"
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
            HomeView()
        case .cart:
            CartView()
        case .favorites:
            FavoritesView()
        case .orders:
            OrdersView()
        }
    }
}
