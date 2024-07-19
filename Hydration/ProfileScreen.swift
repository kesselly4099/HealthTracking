import SwiftUI

struct ProfileScreen: View {
    @ObservedObject var user: User
    @State private var isEditProfilePresented = false

    var body: some View {
        NavigationView {
            VStack {
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .padding(.top,70)

                
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Full Name")
                        Spacer()
                        Text(user.name ?? "Unknown")
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
                    
                    HStack {
                        Text("Gender")
                        Spacer()
                        Text(user.gender ?? "Unknown")
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
                    
                    HStack {
                        Text("Age")
                        Spacer()
                        Text("\(user.age)")
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
                    
                    HStack {
                        Text("Weight (KG)")
                        Spacer()
                        Text("\(user.weight)")
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
                    
                    HStack {
                        Text("Height (CM)")
                        Spacer()
                        Text("\(user.height)")
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
                }
                .padding()
                
                Spacer()
                
                NavigationLink(destination: EditProfileScreen(user: user)) {
                    Text("Edit Profile")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 10)
                }
                
                Spacer()
            }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.1)]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("")
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        let context = CoreDataManager.shared.viewContext
        let newUser = User(context: context)
        newUser.name = "John Doe"
        newUser.email = "john@example.com"
        newUser.gender = "Male"
        newUser.age = 30
        newUser.weight = 70
        newUser.height = 175
        return ProfileScreen(user: newUser)
            .environment(\.managedObjectContext, context)
    }
}
