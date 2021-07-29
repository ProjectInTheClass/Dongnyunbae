//
//  QuestionViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/07/22.
//

import UIKit

class QuestionViewController: UIViewController {
    
    
//    var questions: [Question] = [
//        Question(text: "Which food do you like the most?",
//                 type: .single,
//                 answers: [
//                    Answer(text: "Steak", type: .dog),
//                    Answer(text: "Fish", type: .cat),
//                    Answer(text: "Carrots", type: .rabbit),
//                    Answer(text: "Corn", type: .turtle) ]),
//        Question(text: "Which activities do you enjoy?",
//                 type: .multiple,
//                 answers: [
//                    Answer(text: "Swimming", type: .turtle),
//                    Answer(text: "Sleeping", type: .cat),
//                    Answer(text: "Cuddling", type: .rabbit),
//                    Answer(text: "Eating", type: .dog)
//                 ]),
//        Question(text: "How much do you enjoy car rides?",
//                 type: .ranged,
//                 answers: [
//                    Answer(text: "I dislike them", type: .cat),
//                    Answer(text: "I get a little nervous", type: .rabbit),
//                    Answer(text: "I barely notice them", type: .turtle),
//                    Answer(text: "I love them", type: .dog)
//                 ])
//    ]
    
    var questionIndex = 0
    var answersChosen: [Answer] = []
    
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var questionProgressView: UIProgressView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        for button in singleButtons {
        
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1).cgColor
        }

        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswer = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        
        updateSingleStack(using: currentAnswer)
            
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen
        }
        
    }
    
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        
        for index in 0...1 {
            singleButtons[index].setTitle(answers[index].text, for: .normal)
        }
    }
    
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        answersChosen.append(currentAnswers[0])
        print(answersChosen.map { $0.type })
        nextQuestion()
        
    }
    
    

}
