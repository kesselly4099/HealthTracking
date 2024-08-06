//import SwiftUI
//
//struct StepsView: View {
//    @ObservedObject var activityData: ActivityData
//    @Environment(\.presentationMode) var presentationMode
//
//    @State private var isAnimating = false
//
//    var body: some View {
//        VStack {
//            HStack {
//                    Button(action: {
//                        presentationMode.wrappedValue.dismiss()
//                    }) {
//                        Image(systemName: "chevron.left")
//                            .foregroundColor(.blue)
//                            .imageScale(.large)
//                    }
//                Spacer()
//                   
//            }
//                .frame(width: 350,height: 30)
//                .safeAreaPadding()
//            
//            
//                ZStack {
//                    Circle()
//                        .foregroundColor(.cyan)
//                        .scaleEffect(isAnimating ? 1 : 0.9)
//                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isAnimating)
//                        
//                    Circle()
//                        .foregroundColor(.blue)
//                        .opacity(0.3)
//                        .scaleEffect(0.75)
//                        .offset(x: 0.4)
//                        .padding(.bottom,25)
//                        
//
//                    VStack {
//                        Image(systemName: "figure.walk.motion")
//                            .imageScale(.large)
//                            .foregroundColor(.white)
//                            .padding(.bottom, 10)
//
//                        Text("Steps")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//                            .padding(.bottom, 5)
//
//                        Text("\(activityData.steps)")
//                            .font(.title)
//                            .foregroundColor(.white)
//                    }
//                    
//                }.frame(width: 350,height: 350)
//                
//                
//            
//            
//            ActivityGraphView(steps: activityData.weeklySteps)
//                
//                //.padding(.horizontal)
//                .background(Color(.systemGray6))
//                .cornerRadius(5)
//                .shadow(radius: 10)
//            
//Spacer()
//                    .padding(.bottom,35)
//                .onAppear {
//                    isAnimating = true
//                    
//            }
//            }
//        }
//} 
//
//
//struct StepsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StepsView(activityData: ActivityData())
//    }
//}


import SwiftUI

struct StepsView: View {
    @ObservedObject var activityData: ActivityData
    @Environment(\.presentationMode) var presentationMode

    @State private var isAnimating = false
    @State private var selectedPeriod: Period = .weekly

    enum Period: String, CaseIterable, Identifiable {
        case daily = "Daily"
        case weekly = "Weekly"
        case monthly = "Monthly"
        var id: String { self.rawValue }
    }

    var body: some View {
        
        
        VStack {
            
            
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .imageScale(.large)
                }
                Spacer()
            }
            .frame(height: 2)
            .padding()
            
            
            ScrollView{
                ZStack {
                    Circle()
                        .foregroundColor(.cyan)
                        .scaleEffect(isAnimating ? 1 : 0.7)
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isAnimating)
                        .frame(height: 300)
                    
                    Circle()
                        .foregroundColor(.blue)
                        .opacity(0.3)
                        .scaleEffect(0.75)
                       
                    
                    VStack {
                        Image(systemName: "figure.walk.motion")
                            .imageScale(.large)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                        
                        Text("Steps")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 5)
                        
                        Text("\(activityData.steps)")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 350, height: 350)
                
                Picker("Select Period", selection: $selectedPeriod) {
                    ForEach(Period.allCases) { period in
                        Text(period.rawValue).tag(period)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                ActivityGraphView(
                    steps: selectedPeriod == .daily ? activityData.dailySteps : selectedPeriod == .weekly ? activityData.weeklySteps : activityData.monthlySteps
                )
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .shadow(radius: 10)
                .padding(.bottom)
                
                TipsView(activityData: activityData)
                
                Spacer()
                    .onAppear {
                        isAnimating = true
                    }
            }
            .background(Color(.systemGray5).edgesIgnoringSafeArea(.top))
        }.background(Color(.systemGray5).edgesIgnoringSafeArea(.top))
    }
}

struct StepsView_Previews: PreviewProvider {
    static var previews: some View {
        StepsView(activityData: ActivityData())
    }
}
