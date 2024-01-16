import SwiftUI

// MainTabView.swift
struct MainTabView: View {
    @State private var selection: Int = 0

    var body: some View {
        TabView(selection: $selection) {
            InfluencerHomeView() // Assuming you have a view named HomeScreenView
                .tabItem {
                    Image(systemName: "house") // Replace with your custom icon if needed
                    Text("Home")
                }
                .tag(0)

            OrdersScreenView() // Assuming you have a view named OrdersScreenView
                .tabItem {
                    Image(systemName: "list.bullet") // Replace with your custom icon if needed
                    Text("Orders")
                }
                .tag(1)

            InfluencerMessageView() // Assuming you have a view named MessagesScreenView
                .tabItem {
                    Image(systemName: "message") // Replace with your custom icon if needed
                    Text("Messages")
                }
                .tag(2)

            InfluencerDashboardView() // Assuming you have a view named ProfileScreenView
                .tabItem {
                    Image(systemName: "person.crop.circle") // Replace with your custom icon if needed
                    Text("Profile")
                }
                .tag(3)
        }
        .accentColor(.blue) // This sets the color of the selected tab item
    }
}


