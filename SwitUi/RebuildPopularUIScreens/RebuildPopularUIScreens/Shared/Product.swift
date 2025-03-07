//
//  Product.swift
//  RebuildPopularUIScreens
//
//  Created by Ezgi Özkan on 4.03.2025.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let category: String?
    let sku: String
    let weight: Int
    let thumbnail: String
    let images: [String]

    var firtImage: String {
        images.first ?? Constants.randomImage
    }
}
