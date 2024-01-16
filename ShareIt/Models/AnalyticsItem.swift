//
//  AnalyticsItem.swift
//  ShareIt
//
//  Created by Taoufik El Kadi on 26/12/2023.
//

import Foundation
import SwiftUI

struct AnalyticsItem: Identifiable {
    let id: UUID
    let title: String
    let value: String
    let iconName: String
    let iconColor: Color
}
