import SwiftUI

struct ReminderSettingsScreen: View {
    @State private var reminderFrequency = 60.0
    @State private var reminderSound = true
    @State private var reminderVolume = 0.5
    @State private var vibration = true
    @State private var allowNotification = true
    
    var body: some View {
        VStack {
            Text("Set Reminder").fontDesign(.serif)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top,70)
            
            
            VStack {
                HStack {
                    Text("Reminder Frequency").fontDesign(.serif)
                    Spacer()
                    Slider(value: $reminderFrequency, in: 30...120, step: 10)
                    Text("\(Int(reminderFrequency)) min")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
                
                HStack {
                    Toggle("Reminder Sound", isOn: $reminderSound).fontDesign(.serif)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
                
                HStack {
                    Text("Reminder Volume").fontDesign(.serif)
                    Slider(value: $reminderVolume)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
                
                HStack {
                    Toggle("Vibration", isOn: $vibration).fontDesign(.serif)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
                
                HStack {
                    Toggle("Allow Notification", isOn: $allowNotification).fontDesign(.serif)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.1)]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ReminderSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ReminderSettingsScreen()
    }
}
