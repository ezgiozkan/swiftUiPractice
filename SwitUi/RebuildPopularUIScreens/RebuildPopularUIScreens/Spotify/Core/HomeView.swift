//
//  HomeView.swift
//  RebuildPopularUIScreens
//
//  Created by Ezgi Özkan on 4.03.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var currentUser: User? = nil
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            HStack {
                ImageLoaderView(urlString: currentUser?.image ?? "")
                    .frame(width: 30,height: 30)
                    .background(.spotifyWhite)
                    .clipShape(Circle())
                    .onTapGesture {
                        
                    }
                ScrollView(.horizontal) {
                    HStack(spacing: 8) {
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 10, height: 10)
                        }
                    }
                    
                }.scrollIndicators(.hidden)
                
            }
        }
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper.getUsers().first
        } catch {
            
        }
    }
}

#Preview {
    HomeView()
}
