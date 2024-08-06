//
//  DistanceView.swift
//  Health Tracking
//
//  Created by Kesselly Kamara on 7/20/24.
//

import SwiftUI

struct DistanceView: View {
    @ObservedObject var activityData: ActivityData

    var body: some View {
        VStack {
            Text("Distance")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("\(activityData.distance)")
                .font(.title)
                .padding()
            Spacer()
        }
    }
}

struct DistanceView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceView(activityData: ActivityData())
    }
}
