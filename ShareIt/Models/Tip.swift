//
//  Tip.swift
//  ShareIt
//
//  Created by Taoufik El Kadi on 26/12/2023.
//

import Foundation

struct Tip: Identifiable, Hashable {
    var id = UUID()
    var imageName: String
    var title: String
    var description: String
}
