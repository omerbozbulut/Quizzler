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
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    let seconds = 0.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionLabel.text = quizBrain.question[quizBrain.questionNumber].text
        progressView.progress = 0.0
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userGotItRight = quizBrain.checkAnswer(sender)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                sender.backgroundColor = UIColor.clear
            }
        }
        else{
            sender.backgroundColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                sender.backgroundColor = UIColor.clear
            }
        }
        quizBrain.updateQuestion()
    }
    
    
    
    @IBAction func updateUI(_ sender: UIButton) {
        progressView.progress = quizBrain.updateProgressView()
        QuestionLabel.text = quizBrain.getQuestionText()
        ScoreLabel.text = "Score: \(quizBrain.score)/\(quizBrain.question.count)"
    }
   
    
    
}

// 1 cevap doğru mu
// 2 score arttır
// 3 sonra soru varmı
// 4 cevap şıkkının rengini değistir
// 5 sonraki soruya gec

// son soruysa 1 4 2
// bidaha 
