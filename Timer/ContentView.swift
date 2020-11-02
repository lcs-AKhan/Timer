//
//  ContentView.swift
//  Timer
//
//  Created by Abdul Ahad Khan on 2020-11-02.
//

import SwiftUI

struct ContentView: View {
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    
    @State var timerPaused: Bool = true
    @State var timer: Timer? = nil
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Section {
                    Text("TIMER")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text("\(hours):\(minutes):\(seconds)")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.vertical)
                    if timerPaused {
                        HStack {
                            Button(action: {
                                print("RESTART")
                            }) {
                                Image("RestartButton2")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                            Button(action: {
                                self.StartTimer()
                            }) {
                                Image("PlayButton")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                        }
                    } else {
                        print("")
                    }
                }
            }
        }
    }
    func StartTimer() {
        timerPaused = false
        // Make a new timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { tempTimer in
            // Check time to add hours, mins, and secs
            if self.seconds == 59 {
                self.seconds = 0
                if self.minutes == 59 {
                    self.minutes = 0
                    self.hours = self.hours + 1
                } else {
                    self.minutes = self.minutes + 1
                }
            } else {
                self.seconds = self.seconds + 1
            }
        }
    }

    func StopTimer() {
        timerPaused = true
        timer?.invalidate()
        timer = nil
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
