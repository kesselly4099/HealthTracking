//
//  CustomizableChartView.swift
//  Health Tracking
//
//  Created by Kesselly Kamara on 8/3/24.
//

import SwiftUI
import Charts

struct CustomizableChartView: View {
    var title: String
    var xAxisLabel: String
    var yAxisLabel: String
    var data: [(String, Int)]
    var barColor: Color

    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.top)

            Chart {
                ForEach(data, id: \.0) { label, value in
                    BarMark(
                        x: .value(xAxisLabel, label),
                        y: .value(yAxisLabel, value)
                    )
                    .foregroundStyle(barColor)
                    .annotation(position: .top) {
                        Text("\(value)")
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

