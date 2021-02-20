//
//  AircraftView.swift
//  PathMoving
//
//  Created by Kim, Min Ho on 2021/02/20.
//

import SwiftUI

struct AircraftView: View {
    @ObservedObject var aircraft = Aircraft(from: .init(x: 0, y: 0),
                                            to: .init(x: 250, y: 600),
                                            control1: .init(x: 300, y: 100),
                                            control2: .init(x: -150, y: 400))
    var body: some View {
        VStack {
            ZStack {
                aircraft.path.stroke(style: StrokeStyle(lineWidth: 0.5))
                aircraft.aircraft
            }
            
            Slider(value: $aircraft.alongTrackDistance, in: (0.0...aircraft.track.totalArcLength)) {
                Text("track")
            }.padding()
            
            Button {
                self.aircraft.fly()
            } label: {
                Text("Fly!")
            }
            .disabled(aircraft.flying)
            .padding()
        }
    }
}

struct AircraftView_Previews: PreviewProvider {
    static var previews: some View {
        AircraftView()
    }
}
