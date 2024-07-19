//
//  GraphView.swift
//  Health Tracking
//
//  Created by Kesselly Kamara on 6/29/24.
//

import SwiftUI

struct GraphViewWater: View {
    var dataPoints: [Double]
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                guard dataPoints.count > 1 else { return }
                let width = geometry.size.width
                let height = geometry.size.height
                let stepX = width / CGFloat(dataPoints.count - 1)
                let maxY = dataPoints.max() ?? 1
                let minY = dataPoints.min() ?? 0
                
                path.move(to: CGPoint(x: 0, y: height * (1 - CGFloat((dataPoints[0] - minY) / (maxY - minY)))))
                
                for index in dataPoints.indices {
                    let xPosition = CGFloat(index) * stepX
                    let yPosition = height * (1 - CGFloat((dataPoints[index] - minY) / (maxY - minY)))
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                }
            }
            .stroke(Color.blue, lineWidth: 2)
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphViewWater(dataPoints: [1055.12, 2155.32, 1500.0, 1850.5, 1650.0])
    }
}
