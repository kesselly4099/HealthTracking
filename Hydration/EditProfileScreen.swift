import SwiftUI

struct EditProfileScreen: View {
    @ObservedObject var user: User
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    @State private var name: String = ""
    @State private var email: String = ""
    @State private var gender: String = "Male"
    @State private var age: Double = 0
    @State private var weight: Double = 0
    @State private var height: Double = 0
    @State private var wakeUpTime: String = ""
    @State private var bedTime: String = ""

    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.top,-25)
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.bottom,25)
            Picker("Gender", selection: $gender) {
                Text("Male").tag("Male").fontDesign(.serif)
                Text("Female").tag("Female").fontDesign(.serif)
                Text("Other").tag("Other").fontDesign(.serif)
            }
            .pickerStyle(SegmentedPickerStyle())

            Slider(value: $age, in: 0...100, step: 1)
            Text("Age: \(Int(age))").fontDesign(.serif) // Convert to Int for display

            Slider(value: $weight, in: 0...200, step: 1)
            Text("Weight (kg): \(weight, specifier: "%.1f")").fontDesign(.serif)

            Slider(value: $height, in: 0...250, step: 1).fontDesign(.serif)
            Text("Height (cm): \(height, specifier: "%.1f")").fontDesign(.serif)

            TextField("Wake Up Time", text: $wakeUpTime).fontDesign(.serif)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            TextField("Bed Time", text: $bedTime)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            Button(action: saveProfile) {
                Text("Save Profile").fontDesign(.serif)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding(20)
        .onAppear(perform: loadProfile)
    }

    private func loadProfile() {
        name = user.name ?? ""
        email = user.email ?? ""
        gender = user.gender ?? "Male"
        age = Double(user.age)
        weight = Double(user.weight)
        height = Double(user.height)
        wakeUpTime = user.wakeUpTime ?? ""
        bedTime = user.bedTime ?? ""
    }

    private func saveProfile() {
        user.name = name
        user.email = email
        user.gender = gender
        user.age = Int32(age)
        user.weight = Float(weight)
        user.height = Float(height)
        user.wakeUpTime = wakeUpTime
        user.bedTime = bedTime

        do {
            try viewContext.save()
            presentationMode.wrappedValue.dismiss()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct EditProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileScreen(user: User(context: CoreDataManager.shared.viewContext))
            .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
    }
}
