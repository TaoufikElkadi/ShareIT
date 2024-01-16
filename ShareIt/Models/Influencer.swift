import Foundation

enum UserRole {
    case influencer
    case company
}

enum SocialMediaPlatform: String, CaseIterable {
    case snapchat = "Snapchat"
    case youtube = "Youtube"
    case twitter = "Twitter"
    case instagram = "Instagram"
    case facebook = "Facebook"
    case tiktok = "Tiktok"
}

struct SocialPlatformData: Hashable {
    let platform: SocialMediaPlatform
    var link: String
    var followers: Int
    var followersType: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(platform)
        hasher.combine(link)
        hasher.combine(followers)
    }

    static func == (lhs: SocialPlatformData, rhs: SocialPlatformData) -> Bool {
        lhs.platform == rhs.platform && lhs.link == rhs.link && lhs.followers == rhs.followers
    }
}

// Represents an influencer
class Influencer: Identifiable {
    let id: UUID  // Unique identifier
    var name: String  // Name of the influencer
    var rating: Double  // Rating of the influencer
    var categories: [String]  // Categories of influence (e.g., "Technology", "Lifestyle")
    var imageName: String  // Identifier for an image asset
    var platforms: [SocialPlatformData]  // List of social platforms the influencer is active on
    var bio: String  // Biography of the influencer

    init(id: UUID = UUID(), name: String, rating: Double, categories: [String], imageName: String, platforms: [SocialPlatformData], bio: String) {
        self.id = id
        self.name = name
        self.rating = rating
        self.categories = categories
        self.imageName = imageName
        self.platforms = platforms
        self.bio = bio
    }
}
