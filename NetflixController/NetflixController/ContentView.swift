//
//  ContentView.swift
//  NetflixController
//
//  Created by URMIL RUPARELIYA on 26/11/24.
//

import SwiftUI

struct ContentView: View {
    // Define your MacBook server URL
    private let serverURL = "http://192.168.1.33:7222" // Replace <macbook-ip> with your MacBook's local IP

    var body: some View {
        VStack(spacing: 20) {
            // Start Button
            Button(action: {
                sendCommand(action: "start")
            }) {
                Text("Start")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            // Pause Button
            Button(action: {
                sendCommand(action: "pause")
            }) {
                Text("Pause")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemBackground))
    }

    // Function to send HTTP commands to the MacBook server     
    private func sendCommand(action: String) {
        guard let url = URL(string: "\(serverURL)/\(action)") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error sending \(action) command: \(error.localizedDescription)")
                return
            }
            print("\(action.capitalized) command sent successfully")
        }
        task.resume()
    }
}

#Preview {
    ContentView()
}
