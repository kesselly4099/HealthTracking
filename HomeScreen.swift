

import SwiftUI
import Charts

struct HomePageView: View {
    @StateObject private var activityData = ActivityData()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        Text("Home")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .fontDesign(.serif)
                            .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.accentColor)
                            .clipShape(Circle())
                    }
                    .padding(.horizontal)
                    
                    VStack(spacing: 20) {
                        HStack(spacing: 5) {
                            NavigationLink(destination: StepsView(activityData: activityData).navigationBarBackButtonHidden(true)){
                                MetricCardView(value: "\(activityData.steps)", color: .cyan, width: 250, iconName: "Steps", iconDescription: "figure.walk")
                                
                            }
                            
                            NavigationLink(destination: CaloriesView(activityData: activityData)) {
                                MetricCardView(value: "\(activityData.calories)", color: Color.blue, width: 100, iconName: "Calories", iconDescription: "flame")
                            }
                        }
                        HStack(spacing:7) {
                            NavigationLink(destination: DistanceView(activityData: activityData)) {
                                MetricCardView(title: "Kilometer", value: "\(activityData.distance) km", color: Color.gray, width: 113, iconName: "Distance", iconDescription: "arrow.triangle.swap")
                            }
                            NavigationLink(destination: HeartRateView(activityData: activityData)) {
                                MetricCardView(title: "Average BPM", value: "\(activityData.heartRate)", color: Color.yellow, width: 113, iconName: "Heart Rate", iconDescription: "heart.fill")
                            }
                            NavigationLink(destination: SleepView(activityData: activityData)) {
                                MetricCardView(title: "Sleep", value: "\(activityData.sleep) hrs", color: Color.pink, width: 113, iconName: "Sleep", iconDescription: "powersleep")
                            }
                        }
                    }
                    .padding(.horizontal)

                    VStack(alignment: .leading) {
                        Text("Train with Apple Watch")
                            .fontDesign(.serif)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                        
                        Image("WELCOM1") // Update with actual image name
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(15)
                            .shadow(radius: 10)
                            .padding(.horizontal)

                        // Adding Graph
                        Text("Activity Graph")
                            .font(.headline)
                            .fontDesign(.serif)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                        
                        ActivityGraphView(steps: activityData.weeklySteps)
                        
                            
                            //.padding(.horizontal)
                            .background(Color(.systemGray6))
                            .cornerRadius(5)
                            .shadow(radius: 10)
                    }

                    VStack(alignment: .leading) {
                        Text("Challenges")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                        
                        ChallengesView()
                            .padding(.horizontal)
                    }
                    
                    HStack {
                        NavigationLink(destination: CustomWorkoutPlansView()) {
                            IconButton(imageName: "figure.walk", color: .yellow)
                        }
                        NavigationLink(destination: HWelcomeScreen()) {
                            IconButton(imageName: "drop.fill", color: .blue)
                        }
                        NavigationLink(destination: EmergencyAlertsView()) {
                            IconButton(imageName: "bell.fill", color: .red)
                        }
                        NavigationLink(destination: PostureMonitoringView()) {
                            IconButton(imageName: "person.fill", color: .green)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
            .navigationBarHidden(true)
        }
        .onAppear {
            activityData.requestAuthorization()
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
