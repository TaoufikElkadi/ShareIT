import SwiftUI

struct InfluencerHomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                WelcomeHeaderView()
                InfluencerSearchBarView()
                TopInfluencersScrollView()
                TipsAndBestPracticesView()
                
                    
            }
        }
        .background(Color("backgroundColor")) // Use your color set for background
        .navigationBarHidden(true)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        
        
    }
}

struct WelcomeHeaderView: View {
    @State private var hasUnreadNotifications = true // Example state variable for notifications

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("computerPerson") // Your profile picture here
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())

                VStack(alignment: .leading) {
                    Text("Hi John!")
                        .font(.headline)
                    Text("Welcome back")
                        .font(.subheadline)
                }

                Spacer()

                NotificationBellView(hasUnreadNotifications: $hasUnreadNotifications)
            }
            .padding(.horizontal)

            Text("Let's make an \nimpact!")
                .font(.title) // Adjusted for thinner text
                .fontWeight(.regular) // Adjusted for thinner text
                .padding(.horizontal) // Aligns with the search bar

        }
        .padding(.top)
    }
}

struct InfluencerSearchBarView: View {
    @State private var searchText = ""

    var body: some View {
        HStack {
            TextField("Search for an Influencer", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
                .padding(.horizontal)
                .padding(.top, 0)
                .padding(.bottom, 10)
        }
    }
}

struct NotificationBellView: View {
    @Binding var hasUnreadNotifications: Bool

    var body: some View {
        ZStack {
            Button(action: {
                // Action for notification bell
            }) {
                Image(systemName: "bell.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .background(Color.white)
                    .clipShape(Circle())
                    .foregroundColor(.gray)
            }
            .frame(width: 40, height: 40)
            .background(Color.white) // White square background
            .clipShape(RoundedRectangle(cornerRadius: 10))

            if hasUnreadNotifications {
                Circle()
                    .fill(Color.red)
                    .frame(width: 8, height: 8)
                    .offset(x: 6, y: -8)
            }
        }
        .frame(width: 50, height: 50) // Ensures the entire button has a specific size
    }
}

struct TopInfluencersScrollView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Top Influencers")
                    .font(.custom("PlusJakartaSans-Medium", size: 18))
                    .fontWeight(.bold)
                Spacer()
                Text("See all")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        // Action to see all influencers
                    }
            }
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(topInfluencers, id: \.id) { influencer in
                        TopInfluencerCardView(influencer: influencer)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}


struct TopInfluencerCardView: View {
    var influencer: Influencer // Replace with your Influencer model

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Image(influencer.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(influencer.name)
                        .font(.subheadline)
                        .fontWeight(.regular)
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 11))
                        Text("\(influencer.rating, specifier: "%.1f") Rating")
                            .font(.custom("PlusJakartaSans-Medium", size: 12)) // Replace 12 with your desired font size
                            .fontWeight(.light)
                    }
                    
                    HStack { // Tags for categories
                        ForEach(influencer.categories, id: \.self) { category in
                            Text(category)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .font(.system(size: 8))
                        }
                    }
                    .frame(width: 130, height: 10)
                    .padding(.top, 5)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .top])
            
            Text("Active Platforms")
                .font(.custom("PlusJakartaSans-Medium", size: 14))
                .padding(.top, 4)
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 20) { // Increased spacing between icons
                ForEach(influencer.platforms, id: \.self) { platform in
                    VStack {
                        Image(platform.platform.rawValue) // Replace with actual image if not using SF Symbols
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 17.5) // Set your desired image size
                            .cornerRadius(10)

                        Text("\(formatNumber(platform.followers)) \n\(platform.followersType)")
                            .font(.custom("PlusJakartaSans-Medium", size: 8))
                    }
                    .frame(width: 65, height: 60) // Set your desired frame size
                    .background(Color(.systemGray6)) // Use your desired background color
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal) // Add padding to the horizontal stack if necessary
        }
        .padding()
        .frame(width: 235, height: 176)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.trailing, 15)
    }

    private func formatNumber(_ number: Int) -> String {
        // Format the number as needed (e.g., convert to "K" for thousands)
        // This is a placeholder function, replace with your own implementation
        return String(number)
    }
}


// Sample data for top influencers
let topInfluencers = [
    Influencer(
        id: UUID(),
        name: "Chris Code",
        rating: 4.9,
        categories: ["Technology", "Education"],
        imageName: "cookingMan",
        platforms: [
            SocialPlatformData(platform: .youtube, link: "youtube.com/ChrisCode", followers: 300000, followersType: "Subscribers"),
            SocialPlatformData(platform: .instagram, link: "instagram.com/ChrisCode", followers: 150000, followersType: "Followers"),
            SocialPlatformData(platform: .facebook, link: "facebook.com/ChrisCode", followers: 250000, followersType: "Followers")
        ],
        bio: "Passionate about sharing tech and educational content to a global audience."
    ),
    Influencer(
        id: UUID(),
        name: "Sally Sews",
        rating: 4.8,
        categories: ["Food", "Education"],
        imageName: "womanInfluencer",
        platforms: [
            SocialPlatformData(platform: .instagram, link: "instagram.com/SallySews", followers: 500000, followersType: "Followers"),
            SocialPlatformData(platform: .facebook, link: "facebook.com/SallySews", followers: 350000, followersType: "Followers"),
            SocialPlatformData(platform: .youtube, link: "youtube.com/SallySews", followers: 150000, followersType: "Subscribers")
        ],
        bio: "Food enthusiast and culinary expert sharing unique recipes and cooking tips."
    ),
    Influencer(
        id: UUID(),
        name: "Fitness Fran",
        rating: 4.7,
        categories: ["Health & Fitness"],
        imageName: "computerPerson",
        platforms: [
            SocialPlatformData(platform: .facebook, link: "facebook.com/FitnessFran", followers: 1000000, followersType: "Followers"),
            SocialPlatformData(platform: .youtube, link: "youtube.com/FitnessFran", followers: 750000, followersType: "Subscribers"),
            SocialPlatformData(platform: .instagram, link: "instagram.com/FitnessFran", followers: 250000, followersType: "Followers")
        ],
        bio: "Dedicated to inspiring others with fitness and wellness tips for a healthier lifestyle."
    )
    // Add more Influencers as needed...
]




struct TipsAndBestPracticesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tips & Best Practices")
                .font(.custom("PlusJakartaSans-Medium", size: 18))
                .fontWeight(.bold)
                .padding([.leading, .top, .bottom])

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tips, id: \.self) { tip in
                        TipCardView(tip: tip)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct TipCardView: View {
    var tip: Tip

    var body: some View {
        VStack(alignment: .leading) {
            Image(tip.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .shadow(radius: 2)
                .padding(.leading, 5)
                .padding(.top, 5)

            Text(tip.title)
                .font(.custom("PlusJakartaSans-Medium", size: 14))
                .padding([.leading, .bottom, .top], 5)
                .padding(.trailing)

            Text(tip.description)
                .font(.custom("PlusJakartaSans-Regular", size: 12))
                .padding(.leading, 5)
                .padding(.trailing)

        }
        .frame(width: 235, height: 191)
        .background(Color.white)
        .cornerRadius(12)
        .padding(.trailing, 15)
    }
}



// Sample data for tips
let tips = [
    Tip(imageName: "prizeWorth", title: "Know Your Worth", description: "You're unique, and so is the vlaue you bring. Understand your market value and price your services accordingly. Don't undersell your influencer!"),
    Tip(imageName: "order", title: "Crystal Clear Communication", description: "Your voice is your strength, use it wisely. Clear professional communication sets the stage for successful collaborations. Make your messages count!"),
    Tip(imageName: "crownQuality", title: "Quality is King", description: "Your content is your kingdom, make it shine. High quality content not only uplifts your brand but also adds value to your promotional services. Create to impress!")
]


func formatNumber(_ number: Int) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 1

    let absNumber = abs(number)
    let sign = (number < 0) ? "-" : ""

    switch absNumber {
    case 1_000_000...:
        let formattedNumber = Double(absNumber) / 1_000_000
        return "\(sign)\(numberFormatter.string(for: formattedNumber)!)M"
    case 1_000...:
        let formattedNumber = Double(absNumber) / 1_000
        return "\(sign)\(numberFormatter.string(for: formattedNumber)!)k"
    default:
        return "\(sign)\(numberFormatter.string(for: absNumber) ?? "")"
    }
}


struct InfluencerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        InfluencerHomeView()
    }
}
