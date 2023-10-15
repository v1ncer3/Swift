//
//  TripViewModel.swift
//  AluraViagens
//
//  Created by Ignácio Júnior on 25/08/23.
//

import Foundation

enum ViagemViewModelType: String{
    case destaques
    case ofertas
    case internacionais
}

protocol ViagemViewModel{
    var tituloSessao: String { get }
    var tipo: ViagemViewModelType { get }
    var viagens: [Viagem] { get set }
    var numeroDeLinhas: Int { get }
}
