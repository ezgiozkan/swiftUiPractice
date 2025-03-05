//
//  SpotifyRecentsCell.swift
//  RebuildPopularUIScreens
//
//  Created by Ezgi Özkan on 4.03.2025.
//

import SwiftUI

struct SpotifyRecentsCell: View {
    var imageName = Constants.randomImage
    var title: String = "Some random title"
    var body: some View {
        HStack {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .lineLimit(2)
        }
         .cornerRadius(6)
         .padding(.trailing, 8)
         .frame(maxWidth: .infinity, alignment: .leading)
         .themeColors(isSelected: false)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        
        VStack {
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
            
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
        }
    }
}
