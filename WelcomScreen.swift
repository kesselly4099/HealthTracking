//
//  WelcomScreen.swift
//  Health Tracking
//
//  Created by Kesselly Kamara on 5/25/24.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
     
                
        
        ZStack {
            
            Image(.WELCOM)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
           
            VStack {
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12, style: .circular).frame(width: 370,height: 70)
                        .foregroundColor(.gray)
                        .opacity(0.3)
                    
                    Text("ARE YOU READY?")
                        .font(.largeTitle)
                        .font(.caption)
                        .bold()
                        .foregroundStyle(.white)
                        .fontDesign(.serif)
                    
                }
                
                
                Spacer(minLength: 300)
                
                
                
           
                ZStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/).frame(width: 370,height: 270)
                        .foregroundColor(.gray)
                        .opacity(0.5)
                        
                    
                    VStack {
                        Text("""
                             Explore The world Of
                                      SmartWatch
                             """)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .fontDesign(.serif)
                        
                        
                        Text("Your personal digital fitness and health tracker")
                            .font(.subheadline)
                            .padding(.bottom, 50)
                            .foregroundColor(.white)
                            .fontDesign(.serif)
                       
                        
                        Button(action: {
                            // Connect to Apple Watch action
                        }) {
                            Label("Connect to Apple Watch", systemImage:"applewatch.watchface")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black)
                                .cornerRadius(10)
                                .fontDesign(.serif)
                                
                        }
                        
                    }
                    
                    
                }
                
                
                Spacer()
            }
        }
       
    }
        
}

#Preview {
    WelcomeScreen()
}
