//
//  QuestionViewController.swift
//  MeokBTI
//
//  Created by 추만석 on 2021/07/22.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var questionIndex = 0
    var answersChosen: [Answer] = []
    
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "먹BTI"
        updateUI()

        for button in singleButtons {
        
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1).cgColor
        }

        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        
        let currentQuestion = questions[questionIndex]
        let currentAnswer = currentQuestion.answers
        
        progressLabel.text = "\(questionIndex+1)/\(questions.count)"
        questionLabel.text = currentQuestion.text
        
        updateSingleStack(using: currentAnswer)
        
        questionLabel.sizeToFit()
        progressLabel.sizeToFit()
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
        if let currentAnswersIndex = singleButtons.firstIndex(of: sender) {
            answersChosen.append(currentAnswers[currentAnswersIndex])
        }
//        let currentAnswer = questions[questionIndex].answers
//        print("currentAnswersIndex",currentAnswersIndex)
    
//
        print(answersChosen.map { $0.type })
        nextQuestion()
        
    }
    
    

}
