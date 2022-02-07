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
    
    let seconds = 0.4
    
    let question = [["Two + Five = Seven ?","True"],
                    ["Two + Four = Six ?","True"],
                    ["Three + Five = Ten ?","False"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //progressView.progress = 0.0
        QuestionLabel.text = question[0][0]
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        result(answer : sender.currentTitle!)
        if question.count-1 > questionNumber{
            questionNumber+=1
        }
        updateQuestion()
    }
    
    func updateQuestion(){
        QuestionLabel.text = question[questionNumber][0]
    }
    
    func result(answer : String) {
        if answer == question[questionNumber][1]{
            if TrueUIButton.titleLabel?.text == answer {
                TrueUIButton.backgroundColor = UIColor.green
                print("true")
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    self.TrueUIButton.backgroundColor = UIColor.clear
                }
            }else if FalseUIButton.titleLabel?.text == answer{
                FalseUIButton.backgroundColor = UIColor.green
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    self.FalseUIButton.backgroundColor = UIColor.clear
                }
                
            }
        }
    }
}

