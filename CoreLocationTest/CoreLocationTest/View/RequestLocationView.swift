//
//  RequestLocationView.swift
//  CoreLocationTest
//
//  Created by Min Ho Kim on 2023/03/16.
//

import SwiftUI

struct RequestLocationView: View {
    @EnvironmentObject var locationManager: LocationDataManager

    var body: some View {
        VStack {
            Image(systemName: "location.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            
            Button {
                locationManager.requestPermission()
            } label: {
                Label("Allow tracking", systemImage: "location")
            }
            .padding(10)
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text("We need your permission to track you.")
                .foregroundColor(.gray)
                .font(.caption)
        }
    }
}

struct RequestLocationView_Previews: PreviewProvider {
    static var previews: some View {
        RequestLocationView()
    }
}
