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
    
    let question = [Question(text : "Two + Five = Seven ?", answer : "True"),
                    Question(text : "Two + Four = Six ?", answer : "True"),
                    Question(text : "Three + Five = Ten ?", answer : "False"),
                    Question(text : "One + Four = Five ?", answer : "True"),
                    Question(text : "Eight + Four = Ten ?", answer : "False"),
                    Question(text : "Seven + Four = Eleven ?", answer : "True")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionLabel.text = question[0].text
        progressView.progress = 0.0
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if question.count-1 > questionNumber{
            result(answer : sender.currentTitle!)
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
    
    func result(answer : String) {
        if question[questionNumber].answer == answer{
            score+=1
            if TrueUIButton.titleLabel?.text == answer {
                TrueUIButton.backgroundColor = UIColor.green
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    self.TrueUIButton.backgroundColor = UIColor.clear
                }
            }else if FalseUIButton.titleLabel?.text == answer{
                FalseUIButton.backgroundColor = UIColor.green
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    self.FalseUIButton.backgroundColor = UIColor.clear
                }
        }
        }else{
            if TrueUIButton.titleLabel?.text == answer {
                TrueUIButton.backgroundColor = UIColor.red
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    self.TrueUIButton.backgroundColor = UIColor.clear
                }
            }else if FalseUIButton.titleLabel?.text == answer{
                FalseUIButton.backgroundColor = UIColor.red
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    self.FalseUIButton.backgroundColor = UIColor.clear
                }
            }
        }
    }
}
