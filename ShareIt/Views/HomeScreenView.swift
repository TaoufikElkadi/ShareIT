import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Sticky Header
            HeaderView()
                .zIndex(1)

            // Scrollable Content
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    SearchBarView()
                    BannerView(circle1Position: CGPoint(x: 370, y: 190), circle2Position: CGPoint(x: 360, y: 190))
                    TopInfluencersView()
                    BenefitsView()
                    SuccessStoriesView()
                    JoinCommunityView()
                }
            }
            
            // Sticky Navigation Bar
            //CustomTabBar()
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color("backgroundColor")) // Apply the color set as the background
        .navigationBarBackButtonHidden(true)

    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            LogoView()
            Spacer()
            LoginButtonView()
        }
        .padding()
        .background(Color("backgroundColor"))
        .shadow(radius: 0.1)
    }
}

struct LogoView: View {
    var body: some View {
        // Replace with your actual logo
        Image("LogoTransparent")
            .resizable()
            .scaledToFit()
            .frame(height: 120)
            .padding([.bottom,.top], -50)
    }
}

struct LoginButtonView: View {
    var body: some View {
        NavigationLink(destination: RoleSelectionView()) {
            Text("Log in")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(Color("buttonColor"))
                .cornerRadius(10)
                .padding(.top, -10)
        }
        .shadow(radius: 3)
    }
}


struct SearchBarView: View {
    @State private var searchText = ""
    
    var body: some View {
        TextField("Search for influencer", text: $searchText)
            .padding(13)
            .background(Color(.white))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct BannerView: View {
    // Properties to adjust the position of the circles
    var circle1Position: CGPoint
    var circle2Position: CGPoint

    var body: some View {
            ZStack {
                // Background with gradient or image
                Image("bannerBackground") // Assuming you have a background image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(15)
                    .frame(height: 200)
                    .clipped()

                // The content of the banner
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()

                    Text("CONNECT.\nCOLLABORATE.\nCREATE.")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading, 20) // Adjust this padding to match the design

                    NavigationLink(destination: RoleSelectionView()) {
                        Text("Get Started")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 130, height: 50)
                            .background(Color("buttonColor"))
                            .cornerRadius(12)
                    }
                    .padding(.leading, 20) // Match this padding with the above text

                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)

            // Semi-transparent quarter circles
            Circle()
                .stroke(Color.white.opacity(0.5), lineWidth: 2)
                .frame(width: 180, height: 180)
                .position(circle1Position)

            Circle()
                .stroke(Color.white.opacity(0.5), lineWidth: 2)
                .frame(width: 300, height: 300)
                .position(circle2Position)

            // Logo images (assumed to be named accordingly in your assets)
            HStack(spacing: 30) {
                Image("Instagram")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 0))
                    .position(x: 270, y: 150)

                Spacer()

                Image("Youtube")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 0))
                    .position(x: 125, y: 105)
            }
            .padding(.horizontal, 20)
            // Adjust position to match design
            
            // Person logo images
            HStack(spacing: 30) {
                Image("cookingMan")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 0))
                    .position(x: 260, y: 65)

                Spacer()

                Image("womanInfluencer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 0))
                    .position(x: -10, y: 160)
            }
            .padding(.horizontal, 20)
            
        }
        .frame(height: 200)
        .padding(.horizontal)
    }
}


struct TopInfluencersView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Top Influencers")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer() // Pushes the two texts to opposite sides
                
                // "See all" text, which would navigate to another view when tapped
                NavigationLink(destination: InfluencersListView()) {
                    Text("See all")
                        .fontWeight(.bold)
                        .foregroundColor(.blue) // Use your app's theme color if needed
                }
            }
            .padding(.horizontal)
            // List of influencers goes here
            // Replace with actual data and list implementation
            ForEach(0..<3) { _ in
                HStack {
                    // Influencer image
                    Image("cookingMan")
                        .resizable()
                        .aspectRatio(contentMode: .fill) // maintain aspect ratio and fill the frame
                        .frame(width: 60, height: 60)
                        .background(Color.gray.opacity(0.3)) // Image background color
                        .clipShape(RoundedRectangle(cornerRadius: 10)) // Squared with border radius
                    
                    VStack(alignment: .leading) {
                        Text("Alex Warner")
                            .fontWeight(.bold)
                        
                        // Tag views
                        HStack {
                            TagView(text: "Technology")
                            TagView(text: "Education")
                        }
                    }
                    
                    Spacer()
                    
                    // Heart icon in a grey circle
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 30, height: 30)
                        .overlay(
                            Image(systemName: "heart.fill")
                                .foregroundColor(.pink)
                        )
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
            }
        }
    }
}

// TagView encapsulates the look of a tag
struct TagView: View {
    let text: String

    var body: some View {
        Text(text)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .font(.caption)
    }
}

struct InfluencersListView: View {
    var body: some View {
        Text("List of all influencers")
    }
}

struct BenefitsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("Benefits of Joining Share It!")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity, alignment: .center) // This will center the title in the VStack
                
                VStack(alignment: .leading, spacing: 10) { // Adjust spacing as needed
                    ForEach(["Access to top influencers", "Streamlined campaign management", "Monetize your social media influence", "Join a global community"], id: \.self) { benefit in
                        HStack {
                            // Blue checkmark inside a blue circle
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue) // Adjust this color to match your design
                                .background(Circle().fill(Color.white))
                                .font(.title3) // Adjust the font size as needed
                            
                            Text(benefit)
                                .fontWeight(.regular) // Use a lighter font weight
                        }
                        .padding([.top, .bottom], 5) // This adds some padding to the top and bottom of each benefit for better spacing
                    }
                }
                .padding([.leading, .trailing, .bottom]) // Add padding on the sides and bottom
            }
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
}


struct SuccessStoriesView: View {
    let successStories = [
        (name: "John Parker", date: "9 May 2023"),
        (name: "Maria Kenellis", date: "10 May 2023"),
        (name: "Sean Doe", date: "11 May 2023")
        // Add more stories as needed
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Success Stories")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading)
            
            ForEach(successStories, id: \.name) { story in
                VStack(alignment: .leading) {
                    HStack {
                        // Person image
                        Image("womanInfluencer") // Replace with your actual image asset
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        
                        VStack(alignment: .leading) {
                            Text(story.name)
                                .fontWeight(.bold)
                            
                            // Gold star for the rating
                            HStack {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(.yellow) // Adjust the color to match the gold/yellow theme

                                Text("5.0 Rating")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        Spacer()

                        // Date of the review
                        Text(story.date)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        .padding([.top, .bottom], 10)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .padding(.horizontal)
                .padding(.top, 10) // Space between cards
            }
        }
    }
}

struct JoinCommunityView: View {
    var body: some View {
        ZStack {
            // Background with gradient or image
            Image("bannerBackground") // Assuming you have a custom background image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(15)
                .clipped()

            // Content
            VStack {
                Text("Join ShareIT Community")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical)

                NavigationLink(destination: RoleSelectionView()) {
                    Text("Join Now")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 120, height: 50)
                        .background(Color("buttonColor"))
                        .cornerRadius(12)
                }
            }

            // Floating profile images
            HStack {
                Spacer()
                
                // Profile 1
                ZStack {
                    Circle()
                        .frame(width: 65, height: 65) // Adjust the size of the outer circle
                        .foregroundColor(Color.black.opacity(0))
                        .overlay(Circle().stroke(Color.white.opacity(0.3), lineWidth: 2))
                    
                    Image("womanInfluencer")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60) // Adjust the size of the inner image
                        .clipShape(Circle())
                        
                }
                .padding(.leading, 10)
                .position(x: 60, y: 140)
                
                // Positioning from the left side

                
                
                // Profile 2
                ZStack {
                    Circle()
                        .frame(width: 45, height: 45) // Adjust the size of the outer circle
                        .foregroundColor(Color.black.opacity(0))
                        .overlay(Circle().stroke(Color.white.opacity(0.3), lineWidth: 2))
                    
                    Image("cookingMan")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40) // Adjust the size of the inner image
                        .clipShape(Circle())
                }
                .padding(.trailing, 10)
                .position(x: 150, y: 115)// Positioning from the right side
                
                Spacer()
            }

        }
        .frame(height: 200)
        .padding(.horizontal)
    }
}






struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}


















//
//
//
//
//
//struct CustomTabBar: View {
//    @State private var activeTab = 1
//
//    var body: some View {
//        VStack(spacing: 0) {
//            // Divider line on top of the navigation bar
//            Divider()
//
//            HStack {
//                Spacer()
//
//                // Home icon
//                Button(action: {
//                    self.activeTab = 1
//                }) {
//                    VStack {
//                        Image(systemName: "house")
//                        if activeTab == 1 {
//                            Spacer().frame(height: 10)
//                            Rectangle()
//                                .frame(width: 30, height: 3)
//                                .foregroundColor(.blue)
//                        }
//                    }
//                }
//                .foregroundColor(activeTab == 1 ? .blue : .gray)
//
//                Spacer()
//
//                // Search icon
//                Button(action: {
//                    self.activeTab = 2
//                }) {
//                    VStack {
//                        Image(systemName: "magnifyingglass")
//                        if activeTab == 2 {
//                            Spacer().frame(height: 10)
//                            Rectangle()
//                                .frame(width: 30, height: 3)
//                                .foregroundColor(.blue)
//                        }
//                    }
//                }
//                .foregroundColor(activeTab == 2 ? .blue : .gray)
//
//                Spacer()
//
//                // Message icon
//                Button(action: {
//                    self.activeTab = 3
//                }) {
//                    VStack {
//                        Image(systemName: "message")
//                        if activeTab == 3 {
//                            Spacer().frame(height: 10)
//                            Rectangle()
//                                .frame(width: 30, height: 3)
//                                .foregroundColor(.blue)
//                        }
//                    }
//                }
//                .foregroundColor(activeTab == 3 ? .blue : .gray)
//
//                Spacer()
//
//                // Notification icon
//                Button(action: {
//                    self.activeTab = 4
//                }) {
//                    VStack {
//                        Image(systemName: "bell")
//                        if activeTab == 4 {
//                            Spacer().frame(height: 10)
//                            Rectangle()
//                                .frame(width: 30, height: 3)
//                                .foregroundColor(.blue)
//                        }
//                    }
//                }
//                .foregroundColor(activeTab == 4 ? .blue : .gray)
//
//                Spacer()
//
//                // Profile icon
//                Button(action: {
//                    self.activeTab = 5
//                }) {
//                    VStack {
//                        Image(systemName: "person.crop.circle")
//                        if activeTab == 5 {
//                            Spacer().frame(height: 10)
//                            Rectangle()
//                                .frame(width: 30, height: 3)
//                                .foregroundColor(.blue)
//                        }
//                    }
//                }
//                .foregroundColor(activeTab == 5 ? .blue : .gray)
//
//                Spacer()
//            }
//            .padding(.vertical, 15) // Add padding to top and bottom for spacing
//            .background(Color.white) // Set the background color to white
//            .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous)) // Round the corners
//        }
//        .edgesIgnoringSafeArea(.bottom) // Ignore the safe area to fit the screen
//        .navigationBarBackButtonHidden(true)
//        .navigationBarHidden(true)
//    }
//}
