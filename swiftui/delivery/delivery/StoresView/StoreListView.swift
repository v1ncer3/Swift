//
//  StoreListView.swift
//  delivery
//
//  Created by Ignácio Júnior on 16/08/23.
//

import SwiftUI

struct StoreListView: View {
    
    let title = "Stores"
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 30){
                ForEach(storesMock){ mock in
                    StoreItemView(order: mock)
                }
            }
        }
        .padding(40)
    }
}

struct StoreListView_Previews: PreviewProvider {
    static var previews: some View {
        StoreListView()
            .previewLayout(.sizeThatFits)
    }
}
