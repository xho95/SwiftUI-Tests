//
//  MultiGridView.swift
//  PhotoGrid
//
//  Created by Kim, Min Ho on 2020/11/05.
//

import SwiftUI

struct MultiGridView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    @State var gridLayout = [GridItem()]
    
    @ObservedObject var viewModel: PhotoLibrary

    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(viewModel.cafes) { cafe in
                            Image(cafe.image)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(maxHeight: 150)
                                .cornerRadius(10)
                                .shadow(color: Color.primary.opacity(0.3), radius: 1)
                            InnerGridView(cafe: cafe)
                        }
                    }
                    .padding(.all, 10)
                    .animation(.interactiveSpring())
                }
                .onAppear {
                    switch UIDevice.current.userInterfaceIdiom {
                    case .pad:
                        gridLayout = [GridItem(), GridItem()]
                    default:
                        break
                    }
                }
                .navigationTitle("Coffee Feed")
                .onChange(of: verticalSizeClass) { value in
                    gridLayout = [GridItem(.adaptive(minimum: verticalSizeClass == .compact ? 100 : 250 )), GridItem(.flexible())]
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct MultiGridView_Previews: PreviewProvider {
    static var previews: some View {
        MultiGridView(viewModel: PhotoLibrary())
    }
}
