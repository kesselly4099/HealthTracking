import SwiftUI

struct OnboardingScreen: View {
    var title: String
    var description: String
    var imageName: String
    @Binding var selectedTab: Int
    @Binding var isOnboardingComplete: Bool

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    if selectedTab > 0 {
                        selectedTab -= 1
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                }
                .padding(.leading, 16)
                
                Spacer()
            }
            .padding(.top, 20)
            
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .shadow(radius: 20)
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
                .fontDesign(.serif)
                .multilineTextAlignment(.center)
            Text(description)
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            Button(action: {
                withAnimation {
                    if selectedTab < 2 { // Assuming there are 3 onboarding screens
                        selectedTab += 1
                    } else {
                        isOnboardingComplete = true
                    }
                }
            }) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 250, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen(
            title: "Welcome to AG Reminder",
            description: "Your Personal Hydration Assistant",
            imageName: "onboarding1",
            selectedTab: .constant(0),
            isOnboardingComplete: .constant(false)
        )
    }
}
