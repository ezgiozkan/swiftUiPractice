//
//  ImageTitleRowCell.swift
//  RebuildPopularUIScreens
//
//  Created by Ezgi Özkan on 7.03.2025.
//

import SwiftUI

struct ImageTitleRowCell: View {
    
    var imageSize: CGFloat = 100
    var imageName: String = Constants.randomImage
    var title: String = "Random Image Name"
    var body: some View {
        VStack(spacing: 16) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyGray)
                .lineLimit(2)
        }.frame(width: imageSize)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ImageTitleRowCell()
    }
}
