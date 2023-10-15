//
//  ViagemDestaqueViewModel.swift
//  AluraViagens
//
//  Created by Ignácio Júnior on 25/08/23.
//

import Foundation

class ViagemDestaqueViewModel: ViagemViewModel{
    var tituloSessao: String{
        return "Destaques"
    }
    
    var tipo: ViagemViewModelType{
        return .destaques
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int{
        return viagens.count
    }
    
    init(_ viagens:[Viagem]){
        self.viagens = viagens
    }
    
}
