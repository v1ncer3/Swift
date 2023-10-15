//
//  DataSourceMock.swift
//  delivery
//
//  Created by Ignácio Júnior on 16/08/23.
//

import Foundation

let ordersMock: [OrderType] = [
    OrderType(id: 1, name: "Restaurant", image: "hamburguer"),
    OrderType(id: 2, name: "Pharmacy", image: "farmacia"),
    OrderType(id: 3, name: "Discount", image: "descontos"),
    OrderType(id: 4, name: "Gourmet", image: "gourmet"),
    OrderType(id: 5, name: "Market", image: "mercado"),
    OrderType(id: 6, name: "Petshop", image: "petshop"),
    OrderType(id: 7, name: "Drinks", image: "bebidas")
]

let carouselMock: [OrderType] = [
    OrderType(id:1, name:"churrasco", image: "barbecue-banner"),
    OrderType(id:2, name:"pf", image: "brazilian-meal-banner"),
    OrderType(id:3, name:"pokesx", image: "pokes-banner")
]

let storesMock: [OrderType] = [
    OrderType(id:1, name:"Açai panda", image: "acai-panda-logo"),
    OrderType(id:2, name:"Bakery", image: "bakery-logo"),
    OrderType(id:3, name:"Carbron", image: "carbron-logo"),
    OrderType(id:4, name:"Food court", image: "food-court-logo"),
    OrderType(id:5, name:"Monstro burger", image: "monstro-burger-logo")
    
]
