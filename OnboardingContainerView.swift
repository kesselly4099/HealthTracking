//
//  OnboardingContainerView.swift
//  Health Tracking
//
//  Created by Kesselly Kamara on 7/5/24.
//


import SwiftUI

struct OnboardingContainerView: View {
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
                        title: "Welcome to AG Reminder",
                        description: "Your Personal Hydration Assistant",
                        imageName: "onboarding1",
                        selectedTab: $selectedTab,
                        isOnboardingComplete: $isOnboardingComplete
                    )
                    .tag(0)
                    
                    OnboardingScreen(
                        title: "Track Your Intake",
                        description: "Keep a record of your daily water intake",
                        imageName: "onboarding2",
                        selectedTab: $selectedTab,
                        isOnboardingComplete: $isOnboardingComplete
                    )
                    .tag(1)
                    
                    OnboardingScreen(
                        title: "Stay Hydrated",
                        description: "Get reminders to drink water",
                        imageName: "onboarding3",
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

struct OnboardingContainerView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContainerView()
            .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
    }
}
