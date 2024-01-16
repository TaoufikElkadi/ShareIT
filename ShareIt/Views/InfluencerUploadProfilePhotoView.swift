import SwiftUI

struct InfluencerUploadProfilePhotoView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color("buttonColor"))
                }
                Spacer()
                Text("Step 4/4")
                    .foregroundColor(.gray)
            }
            .padding()

            Text("Let's Sign in into your account.")
                .font(.title)
                .fontWeight(.bold)            
                .padding([.top, .horizontal])
            
            Text("Upload Profile photo")
                .font(.title3)
                .padding(.horizontal)
            
            // Upload photo area
            VStack {
                ZStack {
                    Circle()
                        .fill(Color("backgroundColor")) // Circle background for the camera icon
                        .frame(width: 50, height: 50) // Adjust size as needed
                    Image(systemName: "camera")
                        .foregroundColor(.black)
                }
                .padding(.bottom, 8) // Space between icon and text
                
                Text("Click to upload photo")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text("you will be directed to your inventory file to select a photo")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true) // Allows text to wrap
            }
            .frame(maxWidth: .infinity, minHeight: 150)
            .padding()
            .background(Color.white)
            .cornerRadius(20) // More rounded corners
            .padding(.horizontal)
            .onTapGesture {
                self.showingImagePicker = true
            }

            Spacer()

            Button("Next") {
                // Next button action
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("buttonColor"))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.bottom, 0)
        }
        .background(Color("backgroundColor"))
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            // ImagePicker goes here
        }
    }
    
    func loadImage() {
        // Implement the image loading logic
    }
}

struct UploadProfilePhotoView_Previews: PreviewProvider {
    static var previews: some View {
        InfluencerUploadProfilePhotoView()
    }
}
