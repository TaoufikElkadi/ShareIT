//
//  Promotion.swift
//  ShareIt
//
//  Created by Taoufik El Kadi on 27/12/2023.
//

import Foundation


struct Promotion: Identifiable {
    let id: UUID
    let name: String
    let description: String
    let price: Double
    let duration: String
    let platformName: SocialMediaPlatform
    let platformIcon: String  // This could be a string representing the icon name in your assets

    init(id: UUID = UUID(), name: String, description: String, price: Double, duration: String, platformName: SocialMediaPlatform, platformIcon: String) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.duration = duration
        self.platformName = platformName
        self.platformIcon = platformIcon
    }
}
