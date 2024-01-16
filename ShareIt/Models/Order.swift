//
//  Order.swift
//  ShareIt
//
//  Created by Taoufik El Kadi on 26/12/2023.
//

import Foundation
import SwiftUI

enum OrderStatus: String, CaseIterable {
    case newOrder = "New Order"
    case active = "Active"
    case closed = "Closed"
}

struct Order: Identifiable {
    let id: UUID
    let title: String
    let promotion: Promotion
    var description: String
    var productMedia: Media?  // Media can be an image or video
    var orderStatus: OrderStatus
    let date: Date  // Date the order was sent

    init(id: UUID = UUID(), title: String, promotion: Promotion, description: String, productMedia: Media? = nil, orderStatus: OrderStatus, date: Date) {
        self.id = id
        self.title = title
        self.promotion = promotion
        self.description = description
        self.productMedia = productMedia
        self.orderStatus = orderStatus
        self.date = date
    }
}


enum Media {
    case image(Image)  // Use your Image type
    case video(URL)    // Example, URL pointing to a video file
}
