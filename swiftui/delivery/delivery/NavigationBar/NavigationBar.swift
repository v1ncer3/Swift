//
//  NavigationBar.swift
//  delivery
//
//  Created by Ignácio Júnior on 16/08/23.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack{
            Spacer()
            Button("Rua Vergueiro, 3185"){
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            Spacer()
            
            Button(action: {}){
                Image(systemName: "bell.badge")
                    .font(.title3)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
            .previewLayout(.sizeThatFits)
            
    }
}
