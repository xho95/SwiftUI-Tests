//
//  LocationErrorView.swift
//  CoreLocationTest
//
//  Created by Min Ho Kim on 2023/03/16.
//

import SwiftUI

struct LocationErrorView: View {
    var errorMessage: String
    
    var body: some View {
        VStack {
            Image(systemName: "xmark.octagon")
                .resizable()
                .frame(width: 100, height: 100)
            
            Text(errorMessage)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.red)
    }
}

struct LocationErrorView_Previews: PreviewProvider {
    static var previews: some View {
        LocationErrorView(errorMessage: "")
    }
}
