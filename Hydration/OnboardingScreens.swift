import SwiftUI

struct OnboardingScreens: View {
    @State private var selectedTab = 0
    @State private var isOnboardingComplete = false
    @StateObject private var user = User(context: CoreDataManager.shared.viewContext)

    var body: some View {
        NavigationView {
            if isOnboardingComplete {
                MainTabView(user: user)
                    .navigationBarHidden(true)
            } else {
                TabView(selection: $selectedTab) {
                    OnboardingScreen(
                        title: "Welcome to Health Tracking Reminder",
                        description: "Your Personal Hydration Assistant",
                        imageName: "no2",
                        selectedTab: $selectedTab,
                        isOnboardingComplete: $isOnboardingComplete
                    )
                    .tag(0)
                    
                    OnboardingScreen(
                        title: "Customize Your Hydration Plan",
                        description: "Tailor Your Water Intake to Your Lifestyle",
                        imageName: "no31",
                        selectedTab: $selectedTab,
                        isOnboardingComplete: $isOnboardingComplete
                    )
                    .tag(1)
                    
                    OnboardingScreen(
                        title: "Never Miss a Sip",
                        description: "Let AquaReminder Keep You Refreshed Throughout the Day",
                        imageName: "no41",
                        selectedTab: $selectedTab,
                        isOnboardingComplete: $isOnboardingComplete
                    )
                    .tag(2)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
        }
    }
}

struct OnboardingScreens_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreens()
            .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
    }
}
