//
//  ViewController_finish.swift
//  quiz
//
//  Created by Ignácio Júnior on 11/08/23.
//

import Foundation
import UIKit


class ViewController_finish: UIViewController{
    var points: Int?
    @IBOutlet weak var results_label: UILabel!
    @IBOutlet weak var stats_label: UILabel!
    @IBOutlet weak var restartQuiz: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSettings()
        configurePerformance()
        // Do any additional setup after loading the view.
    }
    
    func configurePerformance(){
        guard let quantityPoints = points else { return }
        
        results_label.text = "Você acertou \(quantityPoints) de \(array_questions.count) questões"
        
        let percent = percent_calc(quantityPoints, array_questions.count)
        
        stats_label.text = "Seu aproveitamento é de \(percent)%"
    }
    
    func percent_calc(_ qtdPoints: Int, _ questionsLength: Int) -> Int {
        return (qtdPoints * 100) / questionsLength
    }
    
    func layoutSettings(){
        layoutScreen()
        layoutRestart_button()
    }
    
    func layoutScreen(){
        navigationItem.hidesBackButton = true
    }
    
    func layoutRestart_button(){
        restartQuiz.backgroundColor = .clear
        restartQuiz.layer.cornerRadius = 10.0
        restartQuiz.layer.borderWidth = 1
        restartQuiz.layer.borderColor = UIColor.purple.cgColor
        
    }
    @IBAction func restartQuizTimer(_ sender: Any) {
        
    }
}
