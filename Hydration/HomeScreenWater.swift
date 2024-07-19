import SwiftUI

struct HomeScreenWater: View {
    
    @State private var selectedCupSize = 250.0
    @State private var drinkRecords: [(time: String, amount: String)] = [("11:30 am", "150 ml"), ("2:15 pm", "200 ml"), ("3:15 pm", "250 ml")]
    @State private var isSwitchCupPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Cameron Williamson").fontDesign(.serif)
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Daily Drink Target")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .padding()
                
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Goal: 1500 ml").fontDesign(.serif)
                                .font(.headline)
                            Text("Completed: 850 ml")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack {
                            Image("cup11")
                                .resizable()
                                .frame(width: 150, height: 150)
                            Button(action: {
                                isSwitchCupPresented.toggle()
                            }) {
                                Text("Switch cup").fontDesign(.serif)
                                    .font(.headline)
                                    .foregroundColor(.blue)
                            }
                            .sheet(isPresented: $isSwitchCupPresented) {
                                SwitchCupView(selectedCupSize: $selectedCupSize)
                            }
                        }
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Today's records").fontDesign(.serif)
                            .font(.headline)
                            .padding(.bottom, 5)
                        ForEach(drinkRecords, id: \.time) { record in
                            HStack {
                                Text(record.time)
                                    .font(.subheadline)
                                Spacer()
                                Text(record.amount)
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 5)
                        }
                    }
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 10)
                .padding()
                
                Spacer()
            }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.1)]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct SwitchCupView: View {
    @Binding var selectedCupSize: Double
    
    var body: some View {
        VStack {
            Text("Switch Cup Size")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            VStack(spacing: 20) {
                ForEach(0..<2) { row in
                    HStack(spacing: 20) {
                        ForEach(0..<3) { column in
                            let size = Double(100 + (row * 3 + column) * 50)
                            Button(action: {
                                selectedCupSize = size
                            }) {
                                VStack {
                                    Image(systemName: "cup.and.saucer.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.blue)
                                    Text("\(Int(size)) ml")
                                        .font(.headline)
                                }
                                .padding()
                                .background(selectedCupSize == size ? Color.blue.opacity(0.2) : Color.clear)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(selectedCupSize == size ? Color.blue : Color.clear, lineWidth: 2)
                                )
                            }
                        }
                    }
                }
            }
            .padding()
            
            HStack {
                Button(action: {
                    // Dismiss the view
                }) {
                    Text("Cancel").fontDesign(.serif)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 120, height: 50)
                        .background(Color.gray)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 10)
                }
                Button(action: {
                    // Confirm selection
                }) {
                    Text("Ok").fontDesign(.serif)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 120, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 10)
                }
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.1)]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenWater()
    }
}
