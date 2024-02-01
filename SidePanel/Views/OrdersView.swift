//
//  OrdersView.swift
//  SUISandbox
//
//  Created by Yan Moroz on 31.01.2024.
//

import SwiftUI

struct OrdersView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Orders")
                .fontWeight(.bold)
                .font(.title)
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    OrdersView()
}
