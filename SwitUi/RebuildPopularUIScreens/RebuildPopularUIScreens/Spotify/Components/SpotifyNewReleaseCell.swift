//
//  SpotifyNewReleaseCell.swift
//  RebuildPopularUIScreens
//
//  Created by Ezgi Özkan on 4.03.2025.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    var imageName: String = Constants.randomImage
    var headline: String? = "New release from"
    var subheadline: String? = "Some Artist"
    var title: String? = "Some playlist"
    var subtitle: String? = "Single - title"
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                ImageLoaderView(urlString: imageName)
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 2) {
                    if let headline {
                        Text(headline)
                            .foregroundColor(.spotifyGray)
                            .font(.callout)
                    }
                    
                    if let subheadline {
                        Text(subheadline)
                            .foregroundColor(.spotifyWhite)
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                }
            } .frame(maxWidth: .infinity, alignment: .leading)
            
            
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 32) {
                    VStack {
                        
                        if let title {
                            Text(title)
                                .foregroundColor(.spotifyWhite)
                        }
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundColor(.spotifyWhite)
                        }
                    }.font(.callout)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title3)
                            .onTapGesture {
                                
                            }
                            .frame(maxWidth: .infinity,alignment: .leading)
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title3)
                            .onTapGesture {
                                
                            }
                    }
                }
            }
            .padding(.trailing,16)
        }
        .themeColors(isSelected: false)
        .cornerRadius(8)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SpotifyNewReleaseCell()
    }
}
