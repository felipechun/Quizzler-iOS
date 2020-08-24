import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var choiceThree: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        let choices = quizBrain.getChoicesText()
        
        choiceOne.setTitle(choices[0], for: .normal)
        choiceTwo.setTitle(choices[1], for: .normal)
        choiceThree.setTitle(choices[2], for: .normal)
        
        choiceOne.backgroundColor = UIColor.clear
        choiceTwo.backgroundColor = UIColor.clear
        choiceThree.backgroundColor = UIColor.clear
        
        progressBar.progress = quizBrain.getProgress()
    }
    
}

