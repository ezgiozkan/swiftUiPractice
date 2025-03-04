//
//  SpotifyCategoryCell.swift
//  RebuildPopularUIScreens
//
//  Created by Ezgi Özkan on 4.03.2025.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    var title: String = "Music"
    var isSelected: Bool = false
    var body: some View {
        Text(title)
            .font(.callout)
            .padding(.vertical, 8)
            .frame(minWidth: 35)
            .padding(.horizontal, 10)
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
            .cornerRadius(16)
        
    }
}

#Preview {
    ZStack {
        Color.black
        VStack {
            SpotifyCategoryCell(isSelected: false)
        }
    }.ignoresSafeArea()
}
