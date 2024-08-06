//import SwiftUI
//import Charts
//
//struct ActivityGraphView: View {
//    var steps: [(String, Int)]
//
//    var body: some View {
//        VStack {
//            Text("Weekly Activity")
//                .font(.title2)
//                .fontWeight(.bold)
//                .foregroundColor(.primary)
//                .padding(.top)
//
//            Chart {
//                ForEach(steps, id: \.0) { day, step in
//                    BarMark(
//                        x: .value("Day", day),
//                        y: .value("Steps", step)
//                    )
//                    .foregroundStyle(by: .value("Day", day))
//                    .annotation(position: .top) {
//                        Text("\(step)")
//                            .font(.caption)
//                            .foregroundColor(.primary)
//                    }
//                }
//            }
//            .frame(height: 250)
//            .background(Color(.systemGray6))
//            .cornerRadius(5)
//            .shadow(radius: 5)
//            .padding()
//        }
//        .background(Color(.systemBackground))
//        .cornerRadius(15)
//        .shadow(radius: 10)
//        .padding()
//    }
//}
//


import SwiftUI
import Charts

struct ActivityGraphView: View {
    var steps: [(String, Int)]

    var body: some View {
        VStack {
            Text("Activity")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.top)

            Chart {
                ForEach(steps, id: \.0) { day, step in
                    BarMark(
                        x: .value("Day", day),
                        y: .value("Steps", step)
                    )
                    .foregroundStyle(by: .value("Day", day))
                    .annotation(position: .top) {
                        Text("\(step)")
                            .font(.caption)
                            .foregroundColor(.primary)
                    }
                }
            }
            .frame(height: 250)
            .background(Color(.systemGray6))
            .cornerRadius(5)
            .shadow(radius: 5)
            .padding()
        }
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding()
    }
}
