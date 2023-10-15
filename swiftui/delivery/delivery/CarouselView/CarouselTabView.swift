//
//  CarouselTabView.swift
//  delivery
//
//  Created by Ignácio Júnior on 16/08/23.
//

import SwiftUI

struct CarouselTabView: View {
    
    
    var body: some View {
        TabView{
            ForEach(carouselMock){ mock in
                CarouselItemView(order: mock)
            }
        }
        .frame(height: 180)
        //indentificador do index
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

struct CarouselTabView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselTabView()
    }
}
