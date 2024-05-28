import SwiftUI
import Charts

struct HomePageView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        Text("Home")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .fontDesign(.serif)
                        Spacer()
                        Image(.image)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    .padding(.horizontal)

                    VStack(spacing: 20) {
                        HStack(spacing: 20) {
                            MetricCardView(value: "100", color: .cyan, width: 250, iconName: "Step", iconDecription: "figure.walk")
                            MetricCardView(value: "120", color: Color.blue, width: 100, iconName: "Cal", iconDecription: "flame")
                        }
                        HStack(spacing: 20) {
                            MetricCardView(title: "Dist.", value: "2 km", color: Color.gray, width: 110)
                            MetricCardView(title: "Bpm", value: "56", color: Color.yellow, width: 110)
                            MetricCardView(title: "Sleep", value: "8 hrs", color: Color.pink, width: 110)
                        }
                    }
                    .padding(.horizontal)

                    VStack(alignment: .leading) {
                        Text("Train with Apple Watch")
                            .font(.headline)
                            .padding(.horizontal)

                        Image(.WELCOM_1) // Update with actual image name
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding(.horizontal)

                        // Adding Graph
                        Text("Activity Graph")
                            .font(.headline)
                            .fontDesign(.serif)
                            .padding(.horizontal)

                        ActivityGraphView()
                            .frame(height: 200)
                            .padding(.horizontal)
                    }

                    VStack(alignment: .leading) {
                        Text("Challenges")
                            .font(.headline)
                            .padding(.horizontal)

                        ChallengesView()
                            .padding(.horizontal)
                    }

                    HStack {
                        NavigationLink(destination: CustomWorkoutPlansView()) {
                            IconButton(imageName: "figure.walk", color: .yellow)
                        }
                        NavigationLink(destination: HydrationRemindersView()) {
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
    }
}
// posting
struct MetricCardView: View {
    var title: String?
    var value: String
    var color: Color
    var width: CGFloat
    var iconName: String?
    var iconDecription: String?

    var body: some View {
        VStack {
            if let iconName = iconName, let iconDecription = iconDecription {
                Label(iconName, systemImage: iconDecription).bold()
                
                
            }
            Text(value)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            if let title = title {
                Text(title)
                    .font(.headline)
            }
        }
        .frame(width: width, height: 100)
        .background(color.opacity(0.2))
        .cornerRadius(10)
    }
}

struct ChallengesView: View {
    var body: some View {
        VStack(spacing: 10) {
            ChallengeCardView(title: "Jogging", daysLeft: "4 Days Left", participants: "1,372 Participants")
            ChallengeCardView(title: "Swimming", daysLeft: "12 Days Left", participants: "764 Participants")
            ChallengeCardView(title: "Squats", daysLeft: "4 Days Left", participants: "1,372 Participants")
        }
    }
}

struct ChallengeCardView: View {
    var title: String
    var daysLeft: String
    var participants: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            HStack {
                Text(daysLeft)
                Spacer()
                Text(participants)
            }
            .font(.subheadline)
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
    }
}

struct IconButton: View {
    var imageName: String
    var color: Color

    var body: some View {
        Image(systemName: imageName)
            .font(.title)
            .frame(width: 40, height: 40)
            .padding()
            .background(color.opacity(0.2))
            .cornerRadius(5)
    }
}

struct CustomWorkoutPlansView: View {
    var body: some View {
        Text("Custom Workout Plans")
    }
}

struct HydrationRemindersView: View {
    var body: some View {
        Text("Hydration Reminders")
    }
}

struct EmergencyAlertsView: View {
    var body: some View {
        Text("Emergency Alerts")
    }
}

struct PostureMonitoringView: View {
    var body: some View {
        Text("Posture Monitoring")
    }
}

// Define your graph view
struct ActivityGraphView: View {
    var body: some View {
        Chart {
            BarMark(
                x: .value("Day", "Mon"),
                y: .value("Steps", 652)
            )
            BarMark(
                x: .value("Day", "Tue"),
                y: .value("Steps", 723)
            )
            BarMark(
                x: .value("Day", "Wed"),
                y: .value("Steps", 812)
            )
            BarMark(
                x: .value("Day", "Thu"),
                y: .value("Steps", 659)
            )
            BarMark(
                x: .value("Day", "Fri"),
                y: .value("Steps", 900)
            )
            BarMark(
                x: .value("Day", "Sat"),
                y: .value("Steps", 1050)
            )
            BarMark(
                x: .value("Day", "Sun"),
                y: .value("Steps", 700)
            )
        }
        .chartPlotStyle { plotArea in
            plotArea
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
