//
//  ThirdViewController.swift
//  TriviaApp
//
//  Created by Jacob Fein-Ashley on 6/22/18.
//  Copyright © 2018 Jacob Fein-Ashley. All rights reserved.
//

import UIKit
import SwiftyJSON

struct QuestionStruct{
    var Category : String
    var Question : String
    var Answers : [String]
    var Answer : Int
    init(cat : String, q : String, ans : [String], ansN : Int) {
        self.Category = cat
        self.Question = q
        self.Answers = ans
        self.Answer = ansN
    }
}

class ThirdViewController: UIViewController {

    @IBOutlet weak var aAnswerLabel: UILabel!
    @IBOutlet weak var bAnswerLabel: UILabel!
    @IBOutlet weak var cAnswerLabel: UILabel!
    @IBOutlet weak var dAnswerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    var numCorrect = 0
    var numIncorrect = 0

    @IBAction func aPressed(_ sender: UIButton) {
        if checkRight(pressed: 0) {
            questionLabel.textColor = UIColor.green
            questionLabel.text = "CORRECT!"
            numCorrect += 1
            recordStats()
        }else{
            questionLabel.textColor = UIColor.red
            questionLabel.text = "FALSE"
            numIncorrect += 1
            recordStats()
        }
       
    }
    
    @IBAction func bPressed(_ sender: UIButton) {
        if checkRight(pressed: 1) {
            questionLabel.textColor = UIColor.green
            questionLabel.text = "CORRECT!"
            numCorrect += 1
            recordStats()
        }else{
            questionLabel.textColor = UIColor.red
            questionLabel.text = "FALSE"
            numIncorrect += 1
            recordStats()
        }
    }
    
    @IBAction func cPressed(_ sender: UIButton) {
        if checkRight(pressed: 2) {
            questionLabel.textColor = UIColor.green
            questionLabel.text = "CORRECT!"
            numCorrect += 1
            recordStats()
        }else{
            questionLabel.textColor = UIColor.red
            questionLabel.text = "FALSE"
            numIncorrect += 1
             recordStats()
        }
    }
    @IBAction func dPressed(_ sender: UIButton) {
        if checkRight(pressed: 3) {
            questionLabel.textColor = UIColor.green
            questionLabel.text = "CORRECT!"
            numCorrect += 1
            recordStats()
        }else{
            questionLabel.textColor = UIColor.red
            questionLabel.text = "FALSE"
            numIncorrect += 1
            recordStats()
        }
    }
    func recordStats(){
        let firstTab = self.tabBarController?.viewControllers![0] as! FirstViewController
        firstTab.questionsCorrect = numCorrect
        firstTab.questionsAnswered = numCorrect + numIncorrect
        firstTab.avgCorrect = (((Double(firstTab.questionsCorrect)) / Double(firstTab.questionsAnswered)) * 100.0).rounded()
        firstTab.questionsCorrectLabel.text = "Questions Correct: \(numCorrect)"
        firstTab.questionsAnsweredLabel.text = "Questions Answered: \(firstTab.questionsAnswered)"
        firstTab.percentCorrectLabel.text = "Average Questions Correct: \(firstTab.avgCorrect)%"
    }
    
    var QuestionToAdd : [QuestionStruct] = [QuestionStruct(cat: "Unselected", q: "No question entered (If you have entered a question, press next question)", ans: ["", "" , "" , ""], ansN: 0)]
    var category = ""
    var answers : [String] = []
    var questionNum = 0
    var question = ""
    var currentQuestion = 0
  //  var json = JSON(data: <#T##Data#>)
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.question != "" {
            QuestionToAdd.append(QuestionStruct(cat: self.category, q: self.question, ans: self.answers, ansN: self.questionNum))
            print(QuestionToAdd)
        }
        displayQuestion()
        // Do any additional setup after loading the view.
    }
    func addQuestion(){
        var questionAdder = QuestionStruct(cat: category, q: question, ans: answers, ansN: questionNum)
        QuestionToAdd.append(questionAdder)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion(){
        self.aAnswerLabel.text = QuestionToAdd[currentQuestion].Answers[0]
        self.bAnswerLabel.text = QuestionToAdd[currentQuestion].Answers[1]
        self.cAnswerLabel.text = QuestionToAdd[currentQuestion].Answers[2]
        self.dAnswerLabel.text = QuestionToAdd[currentQuestion].Answers[3]
        self.categoryLabel.text = QuestionToAdd[currentQuestion].Category
        questionLabel.textColor = UIColor.black
        self.questionLabel.text = QuestionToAdd[currentQuestion].Question
    }
    func checkRight(pressed : Int) -> Bool{
        if QuestionToAdd[currentQuestion].Answer == pressed {
            return true
        }else{
            return false
        }
      
    }
    @IBAction func nextQuestion(_ sender: Any) {
        if (QuestionToAdd.count - 1) >= currentQuestion + 1{
            currentQuestion += 1
            displayQuestion()
        }else{
            self.questionLabel.text = "No more questions"
            self.aAnswerLabel.text = ""
            self.bAnswerLabel.text = ""
            self.cAnswerLabel.text = ""
            self.dAnswerLabel.text = ""
            self.categoryLabel.text = "None"
        }
    }
    @IBAction func previousQuestion(_ sender: Any) {
        if currentQuestion > 0{
            currentQuestion -= 1
            displayQuestion()
        }else{
            return
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
