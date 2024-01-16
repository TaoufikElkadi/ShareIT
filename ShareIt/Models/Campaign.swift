//
//  Campaign.swift
//  ShareIt
//
//  Created by Taoufik El Kadi on 26/12/2023.
//

import Foundation

struct Campaign: Identifiable {
    let id: UUID
    let title: String
    let imageName: String
    let status: String
    let price: Double
    let influencerName: String
}
