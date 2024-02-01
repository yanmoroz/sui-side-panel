//
//  HomeView.swift
//  SUISandbox
//
//  Created by Yan Moroz on 31.01.2024.
//

import SwiftUI

struct HomeView: View {
    
    
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    HeroImage()
                    ProductList()
                }
            }
        }
        .background(.black)
    }
    
    @ViewBuilder
    private func HeroImage() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .frame(width: 400, height: 400)
                .foregroundStyle(.white.opacity(0.5))
                .offset(CGSize(width: 100.0, height: 10.0))
                .overlay(alignment: .bottomTrailing) {
                    Button(action: {}, label: {
                        HStack(spacing: nil) {
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 35.0)
                                .frame(width: 80, height: 80)
                                .foregroundStyle(.white)
                                .overlay {
                                    Image("cart")
                                        .resizable()
                                        .colorMultiply(.black)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                }
                        }
                    })
                    .offset(CGSize(width: -20.0, height: 50.0))
                }
            
            VStack(spacing: -40) {
                Image("helmet 3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .offset(CGSize(width: 0, height: -30.0))
                
                VStack(alignment: .leading) {
                    Text("Bell Local Helmet")
                        .font(.system(size: 30))
                        .foregroundStyle(.white)
                        .bold()
                    
                    Text("Orange Cycle Helmet")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                    
                    Divider()
                        .hidden()
                }
                .padding(.horizontal, 30)
            }
        }
    }
    
    @ViewBuilder
    private func ProductList() -> some View {
        VStack {
            Product(name: "Xiaomi Ninebot", caption: "Black scooter helmet", image: "helmet 2")
            Product(name: "Unbranded Helmet", caption: "Urban cycling helmet", image: "helmet 1")
        }
        .padding(.top, 30)
    }
    
    @ViewBuilder
    private func Product(name: String, caption: String, image: String) -> some View {
        Button(action: {}) {
            HStack(alignment: .center, spacing: 30) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100, height: 130)
                    .foregroundStyle(.white.opacity(0.5))
                    .overlay(alignment: .center) {
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 110, height: 110)
                    }
                
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                        .bold()
                    
                    Text(caption)
                        .font(.system(size: 15))
                        .foregroundStyle(.white)
                        .opacity(0.3)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.leading, 20)
        }
    }
}

#Preview {
    HomeView()
}
