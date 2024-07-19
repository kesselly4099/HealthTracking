import SwiftUI

struct StatisticsScreen: View {
    var body: some View {
        VStack {
            Text("My Statistics")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            GraphView(dataPoints: [1055.12, 2155.32, 1500.0, 1850.5, 1650.0])
                .frame(height: 200)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 10)
            
            Spacer()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.1)]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

struct StatisticsScreen_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsScreen()
    }
}
