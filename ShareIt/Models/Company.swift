//
//  Company.swift
//  ShareIt
//
//  Created by Taoufik El Kadi on 04/01/2024.
//

import Foundation

class Company: Identifiable {
    let id: UUID
    var name: String
    var industry: String
    var email: String
    var address: String
    var description: String
    var profilePicture: String  // Assuming this is a reference to an image asset

    init(id: UUID = UUID(), name: String, industry: String, email: String, address: String, description: String, profilePicture: String) {
        self.id = id
        self.name = name
        self.industry = industry
        self.email = email
        self.address = address
        self.description = description
        self.profilePicture = profilePicture
    }
}
