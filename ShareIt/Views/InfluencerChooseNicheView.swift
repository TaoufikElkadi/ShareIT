import SwiftUI

struct InfluencerChooseNicheView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedNiche: String?
    
    let niches = ["Food", "Fashion", "Travel", "Technology", "Beauty", "Music"]
    
    var body: some View {
        VStack {
            HStack {
                // Back button
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.blue)
                }
                Spacer()
                Text("Step 3/4")
                    .foregroundColor(.gray)
            }
            .padding()
            .padding(.top, 0)

            VStack(alignment: .leading, spacing: 8) { // Added spacing between title and subtitle
                Text("Let's Sign in into your account.")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Choose your niche")
                    .font(.title3)
            }
            .padding(.horizontal)
            .padding(.top, 0) // Added space between header and title
            .padding(.bottom, 30)
            
            VStack(spacing: 15) {
                ForEach(niches, id: \.self) { niche in
                    HStack {
                        Image(systemName: selectedNiche == niche ? "checkmark.circle.fill" : "circle")
                        Text(niche)
                    }
                    .onTapGesture {
                        selectedNiche = niche
                    }
                    .foregroundColor(selectedNiche == niche ? Color("buttonColor") : .gray)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal)

            Spacer()

            Button("Next") {
                // Action for Next button
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("buttonColor")) // Color set in Assets
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.bottom, 0) // Adjust this value to give more space from the bottom safe area
        }
        .background(Color("backgroundColor")) // Color set in Assets
        // Remove `.edgesIgnoringSafeArea(.all)` to ensure content does not extend into the safe areas
    }
}

struct ChooseNicheView_Previews: PreviewProvider {
    static var previews: some View {
        InfluencerChooseNicheView()
            .previewDevice("iPhone 14 Pro")
    }
}
