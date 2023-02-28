//
//  HeaderView.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 28/02/2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Header")
                .padding(.top, 15)
            
            Text(Date().toString("MMM YYYY"))
                .hAlign(.leading)
                .padding(.top,15)
        }
        .padding(40)
        .background {
            VStack(spacing: 0) {
                Color.white
                Rectangle()
                    .fill(.linearGradient(colors: [.white, .clear], startPoint: .top, endPoint: .bottom))
                    .frame(height: 20)
            }
            .ignoresSafeArea()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
