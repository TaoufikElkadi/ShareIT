import SwiftUI

struct OrdersScreenView: View {
    @State private var selectedOrderStatus: OrderStatus = .newOrder
    

    var orders: [Order] = [ Order(title: "Summer Collection Instagram Promotion",promotion: Promotion(name: "Instagram Post",description: "Promote our summer collection on Instagram",price: 350,duration: "7 days",platformName: .instagram,platformIcon: "Instagram" ),description: "Instagram promotion for the Summer Collection",productMedia: .image(Image("Instagram")),orderStatus: .newOrder,date: Date()),Order(title: "Twitter Engagement Campaign",promotion: Promotion(name: "Twitter Post",description: "Engaging tweet about our new services",price: 200,duration: "3 days",platformName: .twitter,platformIcon: "twitterIcon"),description: "Twitter campaign for the new Service Launch",productMedia: .image(Image("Instagram")),orderStatus: .newOrder,date: Date()),Order(title: "YouTube Product Review",promotion: Promotion(name: "YouTube Video",description: "Create a video review for our latest product",price: 550,duration: "10 days",platformName: .youtube,platformIcon: "youtubeIcon"),description: "YouTube video review for our Latest Tech Gadget",productMedia: .image(Image("Instagram")), orderStatus: .active,date: Date())]

    var body: some View {
            NavigationView {
                
                VStack {
            
                    OrderTypeSegmentedControl(selectedOrderStatus: $selectedOrderStatus)
                        .padding()

                    List {
                        ForEach(orders.filter { $0.orderStatus == selectedOrderStatus }) { order in
                            OrderCell(order: order)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("Order")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .padding(.leading, 5) // Adjust this padding to align as you wish

                            Spacer()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Action for notification bell
                        }) {
                            Image(systemName: "bell.fill") // Replace with your bell image
                        }
                    }
                }
            }
            .background(Color("backgroundColor"))
            .edgesIgnoringSafeArea(.all)
        }
    }

struct OrderTypeSegmentedControl: View {
    @Binding var selectedOrderStatus: OrderStatus
    
    var body: some View {
        Picker("Order Type", selection: $selectedOrderStatus) {
            ForEach(OrderStatus.allCases, id: \.self) { type in
                Text(type.rawValue).tag(type)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct OrderCell: View {
    let order: Order
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(order.promotion.platformIcon) // Replace with your platform icon
                Text(order.title)
                    .font(.headline)
                Spacer()
                Text(DateUtility.formatDate(order.date))
            }
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                Button("Reject", action: {
                    // Reject action
                })
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red.opacity(0.2))
                .cornerRadius(10)
                
                Button("Accept", action: {
                    // Accept action
                })
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct OrdersScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersScreenView()
    }
}
