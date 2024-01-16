import SwiftUI

//let buttonColor = Color(UIColor(red: 94/255, green: 114/255, blue: 228/255, alpha: 1))
//let backgroundColor = Color(UIColor.systemBackground)

struct RoleSelectionView: View {
    @State private var selectedRole: UserRole?
    @EnvironmentObject var appViewModel: AppViewModel

    @State private var navigateToCompanyDetails = false
    @State private var navigateToInfluencerDetails = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text("Step 1/4")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.trailing)
                
                Text("Let's Sign in into your account.")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading)
                    .padding(.top, 20)
                
                Text("Choose your role")
                    .font(.title3)
                    .padding(.leading)
                    .padding(.bottom, 30)
                
                RadioButtonGroup(items: ["I'm an Influencer", "I'm a Company"], selectedRole: $selectedRole)
                    .padding(.leading)
                
                Spacer()
                
                
                
                if let role = selectedRole {
                    
                        Text("Next")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("buttonColor"))
                            .cornerRadius(10)
                    
                    .padding()
                }
            }
            .background(Color("backgroundColor"))
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct RadioButtonGroup: View {
    let items: [String]
    @Binding var selectedRole: UserRole?

    var body: some View {
        ForEach(items, id: \.self) { item in
            RadioButtonField(id: item, label: item, isMarked: self.selectedRole == self.userRoleFromString(item)) { _ in
                self.selectedRole = self.userRoleFromString(item)
            }
        }
    }

    private func userRoleFromString(_ string: String) -> UserRole? {
        switch string {
        case "I'm an Influencer":
            return .influencer
        case "I'm a Company":
            return .company
        default:
            return nil
        }
    }
}



struct RadioButtonField: View {
    let id: String
    let label: String
    let isMarked: Bool
    let callback: (String) -> ()
    
    var body: some View {
        Button(action: {
            self.callback(self.id)
        }) {
            HStack {
                Image(systemName: isMarked ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(isMarked ? Color("buttonColor") : .gray)
                Text(label)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(15)
        }
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct RoleSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        RoleSelectionView().environmentObject(AppViewModel())
    }
}
