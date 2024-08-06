//
//  ChallengesView.swift
//  Health Tracking
//
//  Created by Kesselly Kamara on 7/19/24.
//

import SwiftUI

struct ChallengesView: View {
    var body: some View {
        VStack(spacing: 10) {
            ChallengeCardView(title: "Jogging", daysLeft: "4 Days Left", participants: "1,372 Participants")
            ChallengeCardView(title: "Swimming", daysLeft: "12 Days Left", participants: "764 Participants")
            ChallengeCardView(title: "Squats", daysLeft: "4 Days Left", participants: "1,372 Participants")
        }
    }
}

struct ChallengeCardView: View {
    var title: String
    var daysLeft: String
    var participants: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            HStack {
                Text(daysLeft)
                Spacer()
                Text(participants)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
