//
//  ProgressViewController.swift
//  ClaCla_Art
//
//  Created by Ignácio Júnior on 09/09/23.
//

import UIKit

class ProgressViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var startButton: UIButton!
    var progressBarCounter: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBarView()
        
    }
    
    func progressBarView(){
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { (timer) in
                self.updateProgressBar()
                self.validateProgressBar()
        })
    }
    
    func updateProgressBar(){
        progressView.setProgress(progressBarCounter, animated: true)
        progressBarCounter += 0.25
    }
    
    func validateProgressBar(){
        if self.progressBarCounter == 1.25 {
            progressBarWasFinished()
        }
    }
    
    func progressBarWasFinished(){
        progressView.alpha = 0.15
        startButton.isEnabled = true
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
