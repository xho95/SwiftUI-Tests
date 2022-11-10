//
//  HorizontalPageView.swift
//  ScollPaging
//
//  Created by Min Ho Kim on 2022/11/10.
//

import SwiftUI

struct HorizontalPageView: View {
    var body: some View {
        LazyHStack {
            PageView()
        }
    }
}

struct HorizontalPageView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalPageView()
    }
}
