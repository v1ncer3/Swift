//
//  ViewController.swift
//  quiz
//
//  Created by Ignácio Júnior on 10/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    //IBoutlet -> indica a referencia do elemento (botao, tela....)
    //IBAction -> indica a açao que ira ocorrer relacionado ao elemento (click, change....)
    
    @IBOutlet weak var startQuiz_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSettings()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startQuiz_press_button(_ sender: Any) {
        print("you pressed button")
    }
    
    func layoutSettings(){
        layoutScreenSettings()
        buttonStartSettings()
    }
    
    func layoutScreenSettings(){
        navigationItem.hidesBackButton = true
    }
    
    func buttonStartSettings(){
        //border
        startQuiz_button.backgroundColor = .clear
        startQuiz_button.layer.cornerRadius = 10.0
        startQuiz_button.layer.borderWidth = 1
        startQuiz_button.layer.borderColor = UIColor.purple.cgColor
        
        //text color
        startQuiz_button.titleLabel?.textColor = UIColor.purple
        
    }
}

