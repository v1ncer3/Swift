//
//  StoreItemView.swift
//  delivery
//
//  Created by Ignácio Júnior on 16/08/23.
//

import SwiftUI

struct StoreItemView: View {
    
    let order: OrderType
    
    var body: some View {
        HStack(spacing: 5){
            Image(order.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
            
            Text(order.name)
                .font(.subheadline)
            
            Spacer()
        }
        .onTapGesture {
            print("clicou em \(order.name)")
        }
    }
}

struct StoreItemView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemView(order: OrderType(id: 1, name: "Monstro Burger", image: "monstro-burger-logo"))
            .previewLayout(.sizeThatFits)
    }
}
