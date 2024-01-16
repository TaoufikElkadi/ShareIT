import SwiftUI

struct InfluencerEnterDetailsView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var fullName: String = ""
    @State private var instagramLink: String = ""
    @State private var facebookLink: String = ""
    @State private var tiktokLink: String = ""
    @State private var youtubeLink: String = ""
    @State private var snapchatLink: String = ""
    @State private var bio: String = ""
    
    @State private var navigateToChooseNiche = false
    
    @State private var selectedPlatforms: Set<SocialMediaPlatform> = []
    @State private var platformLinks: [SocialMediaPlatform: String] = [:]


    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    // Back button
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.blue)
                    }
                    Spacer()
                    Text("Step 2/4")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding()
                .padding(.top, safeAreaInsets().top)  // Padding for dynamic island
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Let's Sign in into your account.")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.leading)
                        
                        Text("Enter Details")
                            .font(.title3)
                            .padding(.leading)
                            .padding(.bottom)
                        
                        Group {
                            LabeledTextField(title: "Full Name", placeholder: "Enter your full name", text: $fullName)
                            
                            Text("Bio")
                                .font(.headline)
                                .padding(.leading)
                                .padding(.top)
                            
                            TextEditor(text: $bio)
                                .frame(minHeight: 100) // Adjust the height accordingly
                                .background(Color.white) // Remove border by using the same background color
                                .cornerRadius(8)
                            
                        }
                        .padding(.horizontal)
                        
                        ForEach(SocialMediaPlatform.allCases, id: \.self) { platform in
                            Toggle(isOn: Binding(
                                get: { self.selectedPlatforms.contains(platform) },
                                set: { isSelected in
                                    if isSelected {
                                        self.selectedPlatforms.insert(platform)
                                    } else {
                                        self.selectedPlatforms.remove(platform)
                                        self.platformLinks[platform] = nil
                                    }
                                }
                            )) {
                                Text(platform.rawValue)
                            }
                            .padding(.horizontal)
                            
                            // Show link input field if the platform is selected
                            if selectedPlatforms.contains(platform) {
                                TextField("Enter \(platform.rawValue) link", text: Binding(
                                    get: { self.platformLinks[platform] ?? "" },
                                    set: { self.platformLinks[platform] = $0 }
                                ))
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .padding(.horizontal)
                            }
                        }
                        
                        Button("Next") {
                            // Handle the action for Next button
                            appViewModel.tempName = fullName
                            if !instagramLink.isEmpty {
                                appViewModel.tempPlatforms.append(SocialPlatformData(platform: .instagram, link: instagramLink, followers: 0, followersType: "Followers")) // Replace "Followers" with the appropriate term if different for Instagram
                            }
                            if !facebookLink.isEmpty {
                                appViewModel.tempPlatforms.append(SocialPlatformData(platform: .facebook, link: facebookLink, followers: 0, followersType: "Followers")) // Replace "Followers" with the appropriate term if different for Facebook
                            }
                            if !tiktokLink.isEmpty {
                                appViewModel.tempPlatforms.append(SocialPlatformData(platform: .tiktok, link: tiktokLink, followers: 0, followersType: "Followers")) // Replace "Followers" with the appropriate term if different for TikTok
                            }
                            if !youtubeLink.isEmpty {
                                appViewModel.tempPlatforms.append(SocialPlatformData(platform: .youtube, link: youtubeLink, followers: 0, followersType: "Subscribers")) // YouTube typically uses "Subscribers"
                            }
                            if !snapchatLink.isEmpty {
                                appViewModel.tempPlatforms.append(SocialPlatformData(platform: .snapchat, link: snapchatLink, followers: 0, followersType: "Followers")) // Replace "Followers" with the appropriate term if different for Snapchat
                            }
                            navigateToChooseNiche = true // Trigger navigation
                        }
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("buttonColor"))
                        .cornerRadius(10)
                        .padding()
                    }
                    
                }
            }
            .background(Color("backgroundColor"))
            .edgesIgnoringSafeArea(.all)
            navigationDestination(isPresented: $navigateToChooseNiche) {
                            InfluencerChooseNicheView()
                        }
        }
    }
    
    // Helper function to get safe area insets
    private func safeAreaInsets() -> UIEdgeInsets {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
            .first?.windows
            .filter { $0.isKeyWindow }.first
        return keyWindow?.safeAreaInsets ?? UIEdgeInsets.zero
    }
}

struct LabeledTextField: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.top, 8)
            
            TextField(placeholder, text: $text)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
        }
    }
}

struct EnterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let appViewModel = AppViewModel()

        InfluencerEnterDetailsView()
            .environmentObject(appViewModel)
            .previewDevice("iPhone 14 Pro")
            
    }
}
