import SwiftUI

struct OnboardingScreens: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            OnboardingScreen(
                title: "Welcome to Health Tracking Reminder",
                description: "Your Personal Hydration Assistant",
                imageName: "no2",
                selectedTab: $selectedTab
            )
            .tag(0)
            
            OnboardingScreen(
                title: "Customize Your Hydration Plan",
                description: "Tailor Your Water Intake to Your Lifestyle",
                imageName: "no31",
                selectedTab: $selectedTab
            )
            .tag(1)
            
            OnboardingScreen(
                title: "Never Miss a Sip",
                description: "Let AquaReminder Keep You Refreshed Throughout the Day",
                imageName: "no41",
                selectedTab: $selectedTab
            )
            .tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct OnboardingScreens_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreens()
    }
}
