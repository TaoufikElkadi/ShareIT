//
//  ContentView.swift
//  ShareIt
//
//  Created by Taoufik El Kadi on 18/11/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: AppViewModel

    var body: some View {
        if viewModel.isLoggedIn {
            switch viewModel.userType {
            case .influencer:
                InfluencerHomeView()
            case .company:
                OrdersScreenView()
            default:
                Text("Unknown user type")
            }
        } else {
            HomeScreenView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy AppViewModel for preview purposes
        let dummyViewModel = AppViewModel()
        ContentView(viewModel: dummyViewModel)
    }
}

