//
//  SleepView.swift
//  Health Tracking
//
//  Created by Kesselly Kamara on 7/20/24.
//

import SwiftUI

struct SleepView: View {
    @ObservedObject var activityData: ActivityData

    var body: some View {
        VStack {
            Text("Sleep")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("\(activityData.sleep) hrs")
                .font(.title)
                .padding()
            Spacer()
        }
    }
}

struct SleepView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView(activityData: ActivityData())
    }
}
