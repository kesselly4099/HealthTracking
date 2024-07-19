import SwiftUI
import CoreMotion

struct PostureMonitoringView: View {
    @State private var postureStatus: String = "Good"
    @State private var postureColor: Color = .blue
    @State private var isMonitoring: Bool = false
    @State private var isConnected: Bool = false
    @State private var connectionMessage: String = ""
    @State private var motionData: [Double] = []
    
    private let motionManager = CMMotionManager()
    
    var body: some View {
        VStack {
            Text("Posture Monitoring")
                .font(.largeTitle)
                .fontDesign(.serif)
                .fontWeight(.bold)
                .padding(.top)
            
            Spacer()
            
            if isConnected {
                VStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(postureColor)
                        .padding()
                    
                    Text(postureStatus)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(postureColor)
                }
                .padding()
                .background(postureColor.opacity(0.2))
                .cornerRadius(10)
                
                Spacer()
                
                GraphView(dataPoints: motionData)
                    .frame(height: 200)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    startMonitoring()
                }) {
                    Text(isMonitoring ? "Stop Monitoring" : "Start Monitoring")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(isMonitoring ? Color.red : Color.blue)
                        .cornerRadius(10)
                }
                .padding(.bottom)
            } else {
                VStack {
                    Button(action: connectToAirPods) {
                        Text("Connect to AirPods")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.bottom)
                    
                    Text(connectionMessage)
                        .foregroundColor(.red)
                        .padding(.top, 5)
                }
            }
        }
        .padding()
    }
    
    func connectToAirPods() {
        // Simulate AirPods connection check
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let isAirPodsConnected = Bool.random()
            
            if isAirPodsConnected {
                isConnected = true
                connectionMessage = "AirPods connected successfully."
            } else {
                connectionMessage = "AirPods not found. Please try again."
            }
        }
    }
    
    func startMonitoring() {
        isMonitoring.toggle()
        
        if isMonitoring {
            motionData = []  // Clear previous data
            startMotionUpdates()
        } else {
            stopMotionUpdates()
            postureStatus = "Monitoring Stopped"
            postureColor = .gray
        }
    }
    
    func startMotionUpdates() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
            motionManager.startDeviceMotionUpdates(to: .main) { motion, error in
                guard let motion = motion, error == nil else {
                    return
                }
                
                // Process motion data to determine posture
                let attitude = motion.attitude
                let pitch = attitude.pitch * 180 / .pi
                
                // Append new pitch data to the motionData array
                motionData.append(pitch)
                if motionData.count > 300 {  // Keep only the last 300 data points
                    motionData.removeFirst()
                }
                
                if pitch > 30 || pitch < -30 {
                    postureStatus = "Bad"
                    postureColor = .red
                } else {
                    postureStatus = "Good"
                    postureColor = .blue
                }
                
                 // this is the 
                
                // Continue monitoring if still active
                if isMonitoring {
                    startMotionUpdates()
                }
            }
        }
    }
    
    func stopMotionUpdates() {
        motionManager.stopDeviceMotionUpdates()
    }
}

struct PostureMonitoringView_Previews: PreviewProvider {
    static var previews: some View {
        PostureMonitoringView()
    }
}

