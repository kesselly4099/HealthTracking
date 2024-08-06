import SwiftUI

struct MetricCardView: View {
    var title: String?
    var value: String
    var color: Color
    var width: CGFloat
    var iconName: String?
    var iconDescription: String?

    var body: some View {
        VStack {
            if let iconName = iconName, let iconDescription = iconDescription {
                Label(iconName, systemImage: iconDescription)
                    .bold()
                    .font(.system(size: 15))
            }
            Text(value)
                .font(.system(size: 25))
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

struct MetricCardView_Previews: PreviewProvider {
    static var previews: some View {
        MetricCardView(value: "1000", color: .cyan, width: 250, iconName: "Steps", iconDescription: "figure.walk")
    }
}
