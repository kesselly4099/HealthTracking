import SwiftUI

struct HWelcomeScreen: View {
    @State private var isAnimating = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
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
                
                Spacer()
                ZStack {
                    Image(systemName: "drop.fill")
                        .resizable()
                        .frame(width: 100, height: 150)
                        .foregroundColor(.blue)
                    Image(systemName: "clock.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                        .animation(Animation.linear(duration: 20).repeatForever(autoreverses: false), value: isAnimating)
                        .onAppear {
                            isAnimating = true
                        }.padding(.top)
                }
                Text("Health Tracking Reminder")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .fontDesign(.serif)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                Text("Your Body Needs Water!")
                    .font(.title2)
                    .padding(.top, 10)
                Text("Stay Hydrated, Stay Healthy")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.top, 5)
                Spacer()
                NavigationLink(destination: OnboardingScreens()) {
                    Text("Start Your Journey")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 50)
                .navigationBarBackButtonHidden(true)
            }
            .padding()
            .background(Color.white)
        }.navigationBarBackButtonHidden(true)
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HWelcomeScreen()
    }
}

