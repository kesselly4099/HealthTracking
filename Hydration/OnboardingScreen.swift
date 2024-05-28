import SwiftUI

struct OnboardingScreen: View {
    var title: String
    var description: String
    var imageName: String
    @Binding var selectedTab: Int
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
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
                .multilineTextAlignment(.center) // Center-align the title text
            Text(description)
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center) // Center-align the description text
                .padding()
            Spacer()
            Button(action: {
                withAnimation {
                                    selectedTab += 1
                                }
                // Navigation action for the next screen if needed
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
        .navigationBarBackButtonHidden(true) // Hide the default back button
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen(
                   title: "Welcome to AG Reminder",
                   description: "Your Personal Hydration Assistant",
                   imageName: "onboarding1",
                   selectedTab: .constant(0)
               )
    }
}
