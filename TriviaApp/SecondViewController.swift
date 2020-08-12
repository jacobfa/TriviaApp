//
//  SecondViewController.swift
//  TriviaApp
//
//  Created by Jacob Fein-Ashley on 6/21/18.
//  Copyright © 2018 Jacob Fein-Ashley. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Question{
    var Category : String!
    var Question : String!
    var Answers : [String]!
    var Answer : Int!
}


class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    

    @IBOutlet weak var pickerView: UIPickerView!
    var selectedCategory : String = ""
    var question = ""
    var aAnswer = ""
    var bAnswer = ""
    var cAnswer = ""
    var dAnswer = ""
    let category = ["Math", "Science", "History", "English", "Foreign Language"]
    var aIsTrue : Bool = false
    var bIsTrue : Bool = false
    var cIsTrue : Bool = false
    var dIsTrue : Bool = false
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return category[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategory = category[row]
    }
    func returnVal() -> Int{
        if aIsTrue{
            return 0
        }else if bIsTrue{
            return 1
        }else if cIsTrue{
            return 2
        }else{
            return 3
        }
    }
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var ATextField: UITextField!
    @IBOutlet weak var BTextField: UITextField!
    @IBOutlet weak var CTextField: UITextField!
    @IBOutlet weak var DTextField: UITextField!
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        question = questionTextField.text!
        aAnswer = ATextField.text!
        bAnswer = BTextField.text!
        cAnswer = CTextField.text!
        dAnswer = DTextField.text!
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func aTrue(_ sender: Any) {
        aIsTrue = true
    }
    
    @IBAction func bTrue(_ sender: Any) {
        bIsTrue = true
    }
    
    @IBAction func cTrue(_ sender: Any) {
        cIsTrue = true
    }
    
    @IBAction func dTrue(_ sender: Any) {
        dIsTrue = true
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        let secondTab = self.tabBarController?.viewControllers![2] as! ThirdViewController
        secondTab.category = selectedCategory
        secondTab.answers = [aAnswer, bAnswer, cAnswer, dAnswer]
        secondTab.question = question
        secondTab.questionNum = returnVal()
        secondTab.addQuestion()
//        var questionAdd = QuestionStruct(cat: selectedCategory, q: question, ans: [aAnswer,bAnswer,cAnswer,dAnswer], ansN: returnVal())
//        secondTab.QuestionToAdd.append(questionAdd)
        questionTextField.text = ""
        ATextField.text = ""
        BTextField.text = ""
        CTextField.text = ""
        DTextField.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        questionTextField.delegate = self
        ATextField.delegate = self
        BTextField.delegate = self
        CTextField.delegate = self
        DTextField.delegate = self
        questionTextField.becomeFirstResponder()
        ATextField.becomeFirstResponder()
        BTextField.becomeFirstResponder()
        CTextField.becomeFirstResponder()
        DTextField.becomeFirstResponder()
        selectedCategory = category[0]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

