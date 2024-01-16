import Foundation
import Combine

class AppViewModel: ObservableObject {
    enum UserType {
        case influencer, company, none
    }

    // User enum to store either an Influencer or Company
    enum User {
        case influencer(Influencer)
        case company(Company)
    }

    @Published var isLoggedIn: Bool = false
    @Published var userType: UserType = .none
    @Published var currentUser: User? // Can be Influencer or Company

    // Temporary data for onboarding
    @Published var tempName: String = ""
    @Published var tempEmail: String = ""
    @Published var tempCategories: [String] = []
    @Published var tempImageName: String = ""
    @Published var tempPlatforms: [SocialPlatformData] = []
    @Published var tempRating: Double = 0.0
    @Published var tempIndustry: String = ""
    @Published var tempAddress: String = ""
    @Published var tempDescription: String = ""
    @Published var tempProfilePicture: String = ""
    @Published var tempBio: String = ""

    func finalizeOnboarding() {
        switch userType {
        case .influencer:
            let influencer = Influencer(
                name: tempName,
                rating: tempRating,
                categories: tempCategories,
                imageName: tempImageName,
                platforms: tempPlatforms,
                bio: tempBio // Use the temporary bio data
            )

            currentUser = .influencer(influencer)
        case .company:
            let company = Company(name: tempName, industry: tempIndustry, email: tempEmail, address: tempAddress, description: tempDescription, profilePicture: tempProfilePicture)
            currentUser = .company(company)
        default:
            break
        }

        // Clear temporary data
        clearTemporaryData()
    }

    private func clearTemporaryData() {
        tempName = ""
        tempEmail = ""
        tempCategories = []
        tempImageName = ""
        tempPlatforms = []
        tempRating = 0.0
        tempIndustry = ""
        tempAddress = ""
        tempDescription = ""
        tempProfilePicture = ""
        tempBio = ""
    }
}
