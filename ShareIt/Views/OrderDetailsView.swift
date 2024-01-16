import SwiftUI
import AVKit

struct OrderDetailsView: View {
    var order: Order // Using the updated Order struct
    
    var body: some View {
        ZStack {
            Color("backgroundColor").edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    OrderHeaderView(order: order)
                        .padding()
                        .shadow(radius: 2)
                    
                    if let media = order.productMedia {
                        switch media {
                        case .image(let image):
                            UploadedMediaView(image: image)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1))) // Semi-transparent white background
                                .shadow(radius: 2)

                        case .video(let videoURL):
                            // Use VideoPlayer to handle video URL
                            VideoPlayer(player: AVPlayer(url: videoURL))
                                .frame(height: 200) // Specify a height for the video player
                                .cornerRadius(10)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                                .shadow(radius: 2)
                        }
                    }
                    
                    DescriptionView(description: order.description)
                        .padding()
                        .shadow(radius: 2)
                    
                    ActionButtons()
                        .padding()
                }
                .padding()
            }
        }
        .navigationBarTitle("Order Details", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            // Action for the notification bell
        }) {
            Image(systemName: "bell.fill").foregroundColor(.white) // Bell icon in white
        })
    }
}

struct OrderHeaderView: View {
    var order: Order
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: order.promotion.platformIcon) // Platform icon image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
                
                VStack(alignment: .leading) {
                    Text(order.title)
                        .font(.custom("PlusJakartaSans-Medium", size: 18))
                        .foregroundColor(.black) // Title text in white
                    
                    // Display the price with a dollar sign
                    Text("$\(order.promotion.price)")
                        .font(.custom("PlusJakartaSans-Medium", size: 18))
                        .foregroundColor(.black) // Price text in white
                }
                
                Spacer()
                
                Text(DateUtility.formatDate(order.date))
                           .font(.custom("PlusJakartaSans-Medium", size: 18))
                           .foregroundColor(.gray)
            }
            
            Text(order.description)
                .font(.custom("PlusJakartaSans-Medium", size: 18))                .foregroundColor(.black) // Description text in white
        }
    }
}

struct UploadedMediaView: View {
    var image: Image // Using the Image type
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Uploaded Media")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black) // Text in white
                
                Spacer()
                
                // Download button
                Button(action: {
                    // Action for download
                }) {
                    Image(systemName: "arrow.down.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white) // Download icon in white
                }
            }
            
            image
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
        }
    }
}

struct DescriptionView: View {
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black) // Text in white
            
            Text(description)
                .font(.body)
                .foregroundColor(.black) // Description text in white
        }
    }
}

struct ActionButtons: View {
    var body: some View {
        HStack {
            Button("Reject") {
                // Reject action
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.red) // Red background
            .foregroundColor(.white) // Text in white
            .cornerRadius(10)
            
            Button("Accept") {
                // Accept action
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue) // Blue background
            .foregroundColor(.white) // Text in white
            .cornerRadius(10)
        }
    }
}

// Preview provider with an example order
struct OrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample promotion for the order
        let samplePromotion = Promotion(
            id: UUID(),
            name: "Instagram Post",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            price: 350,
            duration: "7 days",
            platformName: .instagram,
            platformIcon: "instagramIcon" // Replace with the actual icon name from your assets
        )

        // Create a sample order using the new structure
        let sampleOrder = Order(
            title: "Instagram Promotion",
            promotion: samplePromotion,
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            productMedia: .image(Image("your_image_placeholder")), // Replace "your_image_placeholder" with your image asset name
            orderStatus: .newOrder,
            date: Date() // Current date for preview
        )

        // Preview the OrderDetailsView with the sample order
        OrderDetailsView(order: sampleOrder)
    }
}
