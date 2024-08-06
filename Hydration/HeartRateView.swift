//
//  HeartRateView.swift
//  Health Tracking
//
//  Created by Kesselly Kamara on 7/20/24.
//

import SwiftUI

struct HeartRateView: View {
    @ObservedObject var activityData: ActivityData

    var body: some View {
        VStack {
            Text("Heart Rate")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("\(activityData.heartRate)")
                .font(.title)
                .padding()
            Spacer()
        }
    }
}

struct HeartRateView_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateView(activityData: ActivityData())
    }
}
