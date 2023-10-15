//
//  ViewController_question.swift
//  quiz
//
//  Created by Ignácio Júnior on 11/08/23.
//

import UIKit

class ViewController_question: UIViewController {

    var points = 0
    var questionNumber = 0
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var array_answersButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSettings()
        buildQuestion()
        
        // Do any additional setup after loading the view.
    }
    
    func layoutSettings(){
        layoutSettings_question()
        layoutSettingsButtons_question()
    }
    
    func layoutSettings_question() {
        navigationItem.hidesBackButton = true
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
    }
    
    func layoutSettingsButtons_question() {
        for button in array_answersButton {
            button.layer.cornerRadius = 10.0
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.purple.cgColor
            button.titleLabel?.textColor = UIColor.purple
            
        }
    }
    
    @IBAction func answer_pressedButton(_ selectedButton: UIButton) {
        let isCorrect = selectedButton.tag == array_questions[questionNumber].correctAnswer
        
        if(isCorrect){
            points += 1
            selectedButton.backgroundColor = UIColor(red: 17/255, green: 255/255, blue: 17/255, alpha: 1.0)
        }else{
            selectedButton.backgroundColor = UIColor(red: 211/255, green: 17/255, blue: 17/255, alpha: 1.0)
        }
        let haveMoreQuestions = (questionNumber < array_questions.count - 1)
    
        if(haveMoreQuestions){
            questionNumber += 1
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(buildQuestion), userInfo: nil, repeats: false)
        }else{
            navToStatsScreen()
        }
        
    }
    
    func navToStatsScreen(){
        performSegue(withIdentifier: "gotToStats", sender: nil)
    }
    
    @objc func buildQuestion() {
        titleLabel.text = array_questions[questionNumber].title
        
        for answerButton in array_answersButton{
            answerButton.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
            let configButton = array_questions[questionNumber].answers[answerButton.tag]
            
            answerButton.setTitle(configButton, for: .normal)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let statsVC = segue.destination as? ViewController_finish else {return}
        
        statsVC.points = points
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
