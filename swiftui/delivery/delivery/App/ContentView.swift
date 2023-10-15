//
//  ContentView.swift
//  delivery
//
//  Created by Ignácio Júnior on 15/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            NavigationBar()
            ScrollView(.vertical, showsIndicators: true){
                VStack(spacing: 20){
                    OrderTypeGridView()
                    CarouselTabView()
                    StoreListView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
