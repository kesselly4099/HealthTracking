//
//  SetGoalScreen.swift
//  Health Tracking
//
//  Created by Kesselly Kamara on 6/29/24.
//

import SwiftUI

struct SetGoalScreen: View {
    @State private var wakeUpTime = Date()
    @State private var bedTime = Date()
    @State private var waterIntakeGoal = 2000.0
    
    var body: some View {
        VStack {
           
            Image(systemName: "target")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding(.top,60)
            Text("Set Your Goal").fontDesign(.serif)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            Text("Daily Water Intake Goal").fontDesign(.serif)
                .font(.body)
                .foregroundColor(.gray)
                .padding()
            Spacer()
            VStack(spacing: 20) {
                HStack {
                    Text("Wake Up Time").fontDesign(.serif)
                    Spacer()
                    DatePicker("", selection: $wakeUpTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
                
                HStack {
                    Text("Bed Time").fontDesign(.serif)
                    Spacer()
                    DatePicker("", selection: $bedTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
                
                VStack {
                    Text("Daily Water Intake Goal").fontDesign(.serif)
                    Slider(value: $waterIntakeGoal, in: 500...4000, step: 100)
                        .accentColor(.blue)
                    Text("\(Int(waterIntakeGoal)) ml").fontDesign(.serif)
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
            }
            .padding()
            Spacer()
            Button(action: {
                // Save goal action
            }) {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 250, height: 50)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 10)
            }.padding(.bottom,50)
            Spacer()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.1)]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

struct SetGoalScreen_Previews: PreviewProvider {
    static var previews: some View {
        SetGoalScreen()
    }
}
