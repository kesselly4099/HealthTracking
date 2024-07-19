import SwiftUI

struct MainTabView: View {
    @ObservedObject var user: User

    var body: some View {
        TabView {
            HomeScreenWater()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            SetGoalScreen()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Statistics")
                }
            ReminderSettingsScreen()
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("Reminders")
                }
            ProfileScreen(user: user)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        let context = CoreDataManager.shared.viewContext
        let newUser = User(context: context)
        newUser.name = "John Doe"
        newUser.email = "john@example.com"
        newUser.gender = "Male"
        newUser.age = 30
        newUser.weight = 70
        newUser.height = 175
        return MainTabView(user: newUser)
            .environment(\.managedObjectContext, context)
    }
}
