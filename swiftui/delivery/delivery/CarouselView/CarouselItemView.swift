//
//  CarouselItemView.swift
//  delivery
//
//  Created by Ignácio Júnior on 16/08/23.
//

import SwiftUI

struct CarouselItemView: View {
    
    let order: OrderType
    
    var body: some View {
        Image(order.image)
        //ocupa todo o espaço disponivel
            .resizable()
        //garante a escala da imagem
            .scaledToFit()
            .onTapGesture {
                print("clicou em \(order.name)")
            }
    }
}

struct CarouselItemView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselItemView(order: OrderType(id: 1, name: "churrasco", image: "pokes-banner"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
