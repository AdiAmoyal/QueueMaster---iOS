//
//  HomeView.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 28/02/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                CalendarView()
            }
            .safeAreaInset(edge: .top, spacing: 0) {
                HeaderView()
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
