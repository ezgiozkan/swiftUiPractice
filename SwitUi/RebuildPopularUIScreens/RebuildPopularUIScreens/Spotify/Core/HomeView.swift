//
//  HomeView.swift
//  RebuildPopularUIScreens
//
//  Created by Ezgi Özkan on 4.03.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders], content: {
                    Section {
                        ForEach(0..<20){ _ in
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 200, height: 200)
                        }
                    } header: {
                        header
                    }
                }).padding(.top, 8)
                
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
        } catch {
            
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .frame(width: 35,height: 35)
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
}

#Preview {
    HomeView()
}
