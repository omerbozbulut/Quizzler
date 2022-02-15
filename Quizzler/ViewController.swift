//
//  ViewController.swift
//  Quizzler
//
//  Created by omer faruk bozbulut on 7.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var TrueUIButton: UIButton!
    
    @IBOutlet weak var FalseUIButton: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var questionNumber : Int = 0
    
    let seconds = 0.2
    
    var score : Int = 0
    
    let question = [Question(q : "Two + Five = Seven ?", a : "True"),
                    Question(q : "Two + Four = Six ?", a : "True"),
                    Question(q : "Three + Five = Ten ?", a : "False"),
                    Question(q : "One + Four = Five ?", a : "True"),
                    Question(q : "Eight + Four = Ten ?", a : "False"),
                    Question(q : "Seven + Four = Eleven ?", a : "True")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionLabel.text = question[questionNumber].text
        progressView.progress = 0.0
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if question.count-1 > questionNumber{
            result(currentButton : sender)
            questionNumber+=1
            updateProgressView()
            updateQuestion()
        }else{
            QuestionLabel.text = "Score: \(score)/\(question.count)"
            progressView.progress = 1.0
        }
    }
    
    func updateQuestion(){
        QuestionLabel.text = question[questionNumber].text
    }
    
    func updateProgressView(){
        let percentageProgress : Float = Float(questionNumber)/Float(question.count)
        progressView.progress = percentageProgress
    }
    
    func result(currentButton : UIButton) {
        if question[questionNumber].answer == currentButton.currentTitle{
            score+=1
            currentButton.backgroundColor = UIColor.green
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
               currentButton.backgroundColor = UIColor.clear
        }
        }
        else{
            currentButton.backgroundColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                currentButton.backgroundColor = UIColor.clear
        }
        }
    }
}
