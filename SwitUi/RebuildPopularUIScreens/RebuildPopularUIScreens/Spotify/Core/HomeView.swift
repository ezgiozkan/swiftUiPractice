//
//  HomeView.swift
//  RebuildPopularUIScreens
//
//  Created by Ezgi Özkan on 4.03.2025.
//

import SwiftUI
import SwiftfulUI

struct HomeView: View {
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []
    @State private var productsRow: [ProductRow] = []
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(
                    spacing: 1,
                    pinnedViews: [.sectionHeaders],
                    content: {
                        Section {
                            VStack {
                                recentsSection
                                
                                if let product = products.first {
                                    newReleaseSection(product: product)
                                }
                                
                                ForEach(productsRow) { row in
                                    VStack(spacing: 8) {
                                        Text(row.title)
                                            .font(.title)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.spotifyWhite)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        ScrollView(.horizontal) {
                                            HStack(spacing: 16) {
                                                ForEach(
                                                    row.products
                                                ) { product in
                                                    ImageTitleRowCell(
                                                        imageSize: 120,
                                                        imageName: product.firtImage,
                                                        title: product.title
                                                    )
                                                }
                                            }
                                        }.scrollIndicators(.hidden)
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                        } header: {
                            header
                        }
                    }).padding(.top, 16)
                
            }.scrollIndicators(.hidden)
                .clipped()
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper.getUsers().first
            products = try await Array(DatabaseHelper.getProducts().prefix(8))
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0.brand }))
            for brand in allBrands {
                let products = self.products.filter({ $0.brand == brand })
                rows.append(ProductRow(title: brand?.capitalized ?? "", products: products))
            }
            productsRow = rows
        } catch {
            
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .frame(width: 35, height: 35)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                }
            }
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(title: category.rawValue.capitalized,
                                            isSelected: category == selectedCategory)
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }.padding(.horizontal, 16)
                
            }
            .scrollIndicators(.hidden)
        }.padding(.vertical, 24)
         .padding(.leading, 8)
         .frame(maxWidth: .infinity)
         .background(Color.spotifyBlack)
    }
    
    private var recentsSection: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                SpotifyRecentsCell(imageName: product.firtImage, title: product.title)
            }
        }
    }
    
    private func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firtImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description) {
                
            } onPlayPressed: {
                
            }
    }
}

#Preview {
    HomeView()
}
