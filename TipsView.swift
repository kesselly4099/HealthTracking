//
//  TipsView.swift
//  Health Tracking
//
//  Created by Kesselly Kamara on 8/3/24.
//

import SwiftUI

struct TipsView: View {
    @ObservedObject var activityData: ActivityData

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Tips for Walking")
                .font(.headline)
                .fontDesign(.serif)
                .fontWeight(.bold)
                .padding(.bottom, 5)

            Text("Great job! You've walked \(activityData.steps) steps today.")
                .font(.subheadline)
                .padding(.bottom, 2)

            Text("Suggestions to improve your walking:")
                .font(.headline)
                .padding(.bottom, 2)

            ForEach(getSuggestions(), id: \.self) { suggestion in
                Text("• \(suggestion)")
                    .font(.body)
                    .padding(.leading, 10)
            }

            Text("AI-based Health Feedback:")
                .font(.headline)
                .padding(.top, 5)

            Text(getHealthFeedback())
                .font(.body)
                .padding(.leading, 10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }

    private func getSuggestions() -> [String] {
        // These are placeholder suggestions. Replace them with AI-generated suggestions if available.
        return [
            "Take regular breaks to avoid fatigue.",
            "Maintain a steady pace to maximize health benefits.",
            "Stay hydrated, especially during longer walks.",
            "Wear comfortable and supportive shoes."
        ]
    }

    private func getHealthFeedback() -> String {
        // This is a placeholder feedback. Replace it with AI-generated feedback if available.
        return "Based on your activity data, you're maintaining a healthy level of physical activity. Keep it up! Regular walking helps reduce the risk of heart disease, improves mental health, and supports weight management."
    }
}
