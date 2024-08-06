//
//  IconButton.swift
//  Health Tracking
//
//  Created by Kesselly Kamara on 7/19/24.
//

import SwiftUI

struct IconButton: View {
    var imageName: String
    var color: Color

    var body: some View {
        Image(systemName: imageName)
            .font(.title)
            .frame(width: 40, height: 40)
            .padding()
            .background(color.opacity(0.2))
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}
