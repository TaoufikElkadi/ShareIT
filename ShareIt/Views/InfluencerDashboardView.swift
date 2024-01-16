import SwiftUI

struct InfluencerDashboardView: View {
    // Define your data model for orders, analytics, and campaigns here

    var body: some View {
        ScrollView {
            VStack {
                DashboardHeaderView()

                AnalyticsSectionView(analyticsItems: analyticsItems)
//                    .padding()

                OrderSectionView(orderItems: orderItems)
//                    .padding()

                OngoingCampaignsSectionView(campaigns: campaigns)
//                    .padding()

                CompletedCampaignsSectionView(completedCampaigns: completedCampaigns)
//                    .padding()

                Spacer()
            }
        }
        .background(Color("backgroundColor")) // Use your color set for background
        .navigationBarHidden(true)
        .navigationBarTitle("Dashboard", displayMode: .inline)
    }
}

struct DashboardHeaderView: View {
    // Add any header related properties here
    @State private var hasUnreadNotifications = true

    var body: some View {
        HStack {
            Text("Dashboard")
                .font(.custom("PlusJakartaSans-Medium", size: 14))
                .fontWeight(.bold)
            Spacer()
            // Add additional header content if needed
            NotificationBellView(hasUnreadNotifications: $hasUnreadNotifications)
        }
        .padding(.horizontal)
    }
}

let analyticsItems = [
    AnalyticsItem(id: UUID(), title: "Balance", value: "$1.348", iconName: "Balance", iconColor: .blue),
    AnalyticsItem(id: UUID(), title: "Earning in Sept", value: "$1247", iconName: "Earning", iconColor: .red),
    AnalyticsItem(id: UUID(), title: "Active Order", value: "32($7521)", iconName: "Active", iconColor: .orange)
]

struct AnalyticsSectionView: View {
    let analyticsItems: [AnalyticsItem]
    var body: some View {
        VStack {
            Text("Earnings")
                .font(.custom("PlusJakartaSans-Medium", size: 14))
                .fontWeight(.bold)
                .padding(.bottom, 10)

            HStack {
                ForEach(analyticsItems) { item in
                    VStack {
                        ZStack {
                            Image(item.iconName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                        }
                       
                        .padding(.bottom, 5)

                        Text(item.title)
                            .font(.custom("PlusJakartaSans-Regular", size: 8))
                            .foregroundColor(.secondary)
                        Text("\(item.value)")
                            .font(.custom("PlusJakartaSans-Medium", size: 14))
                            .fontWeight(.bold)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                }
            }
            .padding()
        }
    }
}

struct OrderDashboardItem: Identifiable {
    let id: UUID
    let title: String
    let count: Int
    let iconName: String
    let iconBackgroundColor: Color
}

// Example order data
let orderItems = [
    OrderDashboardItem(id: UUID(), title: "New Order", count: 32, iconName: "New Order", iconBackgroundColor: .purple),
    OrderDashboardItem(id: UUID(), title: "Active", count: 4, iconName: "Active", iconBackgroundColor: .orange),
    OrderDashboardItem(id: UUID(), title: "Completed", count: 32, iconName: "Completed", iconBackgroundColor: .green)
]

struct OrderSectionView: View {
    let orderItems: [OrderDashboardItem]

    var body: some View {
        VStack {
            Text("Order")
                .font(.custom("PlusJakartaSans-Medium", size: 14))
                .fontWeight(.bold)
                .padding(.bottom, 10)

            HStack {
                ForEach(orderItems) { item in
                    VStack {
                        Image(item.iconName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                    
                        Text(item.title)
                            .font(.custom("PlusJakartaSans-Regular", size: 8))
                            .foregroundColor(.secondary)
                        Text("\(item.count)")
                            .font(.custom("PlusJakartaSans-Regular", size: 14))
                            .fontWeight(.bold)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                }
            }
        }
        .padding(.horizontal)
    }
}

// Example campaign data
let campaigns = [
    Campaign(id: UUID(), title: "Instagram Highlights Reel", imageName: "campaignImage1", status: "Live", price: 1999.00, influencerName: "Sophie Little"),
    Campaign(id: UUID(), title: "Snapchat Story 24H", imageName: "campaignImage1", status: "Live", price: 997.00, influencerName: "Steve Cummings"),
    Campaign(id: UUID(), title: "Youtube Short 24H", imageName: "campaignImage1", status: "Live", price: 1499.00, influencerName: "Alex Warner"),
    // ... Add more campaigns as needed
]
let completedCampaigns = [
    Campaign(id: UUID(), title: "Instagram Highlights Reel", imageName: "campaignImage1", status: "Completed", price: 1999.00, influencerName: "Sophie Little"),
    Campaign(id: UUID(), title: "Snapchat Story 24H", imageName: "campaignImage1", status: "Completed", price: 997.00, influencerName: "Steve Cummings"),
    Campaign(id: UUID(), title: "Youtube Short 24H", imageName: "campaignImage1", status: "Completed", price: 1499.00, influencerName: "Alex Warner"),
    // ... Add more campaigns as needed
]

struct OngoingCampaignsSectionView: View {
    let campaigns: [Campaign]

    var body: some View {
        VStack {
            HStack {
                Text("Ongoing Campaigns")
                    .font(.custom("PlusJakartaSans-Medium", size: 14))
                    .fontWeight(.bold)
                Spacer()
                Button("See all") {
                    // Action to see all campaigns
                }
                .foregroundColor(.blue)
            }
            .padding([.top, .horizontal])

            ForEach(campaigns) { campaign in
                VStack {
                    Image(campaign.imageName) // Replace with your actual image loading method
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 330, height: 126)
                        .cornerRadius(10)
                        .overlay(
                            Text(campaign.status)
                                .font(.custom("PlusJakartaSans-Medium", size: 14))
                                .padding(8)
                                .background(campaign.status == "Live" ? Color.green : Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding([.top, .trailing]),
                            alignment: .topTrailing
                        )

                    HStack {
                        VStack(alignment: .leading) {
                            Text(campaign.title)
                                .font(.custom("PlusJakartaSans-Medium", size: 14))
                                .lineLimit(1)
                            Text(campaign.influencerName)
                                .font(.custom("PlusJakartaSans-Medium", size: 14))
                                .foregroundColor(.secondary)
                        }
                        
                        Text("$\(campaign.price, specifier: "%.2f")")
                            .font(.custom("PlusJakartaSans-Medium", size: 14))
                            .bold()
                    }
                    .padding([.horizontal, .bottom])
                }
                .frame(width: 350, height: 230)
                .background(Color.white)
                .cornerRadius(10)
            }
        }
    }
}

struct CompletedCampaignsSectionView: View {
    let completedCampaigns: [Campaign] // Your completed campaigns data
    var body: some View {
        VStack {
            HStack {
                Text("Completed Campaigns")
                    .font(.custom("PlusJakartaSans-Medium", size: 14))
                    .fontWeight(.bold)
                Spacer()
                Button("See all") {
                    // Action to see all campaigns
                }
                .foregroundColor(.blue)
            }
            .padding([.top, .horizontal])

            ForEach(completedCampaigns) { campaign in
                VStack {
                    Image(campaign.imageName) // Replace with your actual image loading method
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 330, height: 126)
                        .cornerRadius(10)
                        .overlay(
                            Text(campaign.status)
                                .padding(8)
                                .background(campaign.status == "Competed" ? Color.green : Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding([.top, .trailing]),
                            alignment: .topTrailing
                        )

                    HStack {
                        VStack(alignment: .leading) {
                            Text(campaign.title)
                                .font(.custom("PlusJakartaSans-Medium", size: 14))
                                .lineLimit(1)
                            Text(campaign.influencerName)
                                .font(.custom("PlusJakartaSans-Medium", size: 14))
                                .foregroundColor(.secondary)
                        }
                        
                        Text("$\(campaign.price, specifier: "%.2f")")
                            .bold()
                    }
                    .padding([.horizontal, .bottom])
                }
                .frame(width: 350, height: 230)
                .background(Color.white)
                .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}
// Define your models for orders, analytics, campaigns, etc.

// Example of preview
struct InfluencerDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        InfluencerDashboardView()
    }
}
