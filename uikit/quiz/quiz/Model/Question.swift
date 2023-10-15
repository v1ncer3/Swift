//
//  Question.swift
//  quiz
//
//  Created by Ignácio Júnior on 11/08/23.
//

import Foundation

//usar timer em todos os botoes TO DO

struct Question{
    var title: String
    var answers: [String]
    var correctAnswer: Int
}

let array_questions: [Question] = [
    Question(title: "Qual o maior campeão em copas do mundo?",
             answers: ["Brasil", "Alemanha", "Espanha"],
             correctAnswer: 0),
    
    Question(title: "Qual o jogo eletrônico mais vendido da história?",
             answers: ["Black", "Grand Thieft Auto - V (GTA V)", "Mario"],
             correctAnswer: 1),
    
    Question(title: "Qual o maior motivo do Brasil ser um país lixo?",
             answers: ["População", "Má administração pública", "Corrupção"],
             correctAnswer: 2),
    Question(title: "Qual jogador foi objeto da maior tranferência da história do futebol?",
             answers: ["Neymar", "Cristiano Ronaldo", "Messi"],
            correctAnswer: 0)
]
