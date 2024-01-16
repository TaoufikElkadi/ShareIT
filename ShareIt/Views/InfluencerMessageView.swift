import SwiftUI

struct InfluencerMessageView: View {
    // Dummy data for demonstration purposes
    let messages: [Message] = [
        Message(sender: "Sophie Smith", preview: "Hey there!", isUnread: false),
        Message(sender: "Alexis Finch", preview: "Hey! Wanted to discuss few things...", isUnread: true),
        Message(sender: "John Doe", preview: "Hey bro!!!", isUnread: false),
        // Add more messages as needed
    ]

    var body: some View {
        VStack {
            HStack {
                Text("Messages")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 20)
                
                Spacer()
                
                Image(systemName: "bell.fill") // Example notification bell
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 20)
            }
            
            SearchBarView() // Your custom search bar view
                .padding([.horizontal, .bottom])
            
            List {
                ForEach(messages, id: \.self) { message in
                    HStack {
                        Image("profileImage") // Replace with your image
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(message.sender)
                                .fontWeight(.bold)
                            Text(message.preview)
                                .foregroundColor(.gray)
                                .lineLimit(1)
                        }
                        
                        Spacer()
                        
                        if message.isUnread {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 10, height: 10)
                        }
                    }
                }
            }
        }
    }
}



struct Message: Hashable {
    let sender: String
    let preview: String
    let isUnread: Bool
}

struct InfluencerMessageView_Previews: PreviewProvider {
    static var previews: some View {
        InfluencerMessageView()
    }
}
