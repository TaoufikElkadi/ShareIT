import SwiftUI

struct WelcomeScreenView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    let buttonColor = Color(UIColor(red: 94/255, green: 114/255, blue: 228/255, alpha: 1))

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()

                Image("circlesWelcome")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 1.1)
                    .padding(.top, 20)

                Image("LogoTransparent")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200) // Adjust this as needed to fit your design

                // Tagline text just below the logo
                Text("Connect. Collaborate. Create.")
                    .font(.headline)
                    .foregroundColor(.gray)
                    // If you need the text closer to the logo, you can adjust this padding
                    .padding(.top, -80)

                    Spacer()
                                        
                    // NavigationLink to HomeScreenView
                    NavigationLink(destination: HomeScreenView()) {
                        Text("Get Started")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(buttonColor)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true) // Hide the navigation bar
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
            .environmentObject(AppViewModel()) // Provide the environment object for previews
    }
}
