//
//  FirstViewController.swift
//  TriviaApp
//
//  Created by Jacob Fein-Ashley on 6/21/18.
//  Copyright © 2018 Jacob Fein-Ashley. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import Kingfisher

class FirstViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var avgCorrect = 0.0
    var questionsAnswered = 0
    var questionsCorrect = 0
    var username = ""
    var photoFromProfile : URL?
    
    
    @IBOutlet weak var profilePictureLabel: UILabel!
    @IBOutlet weak var questionsAnsweredLabel: UILabel!
    @IBOutlet weak var percentCorrectLabel: UILabel!
    @IBOutlet weak var profileImageview: UIImageView!
    @IBOutlet weak var questionsCorrectLabel: UILabel!
    let imagePickerController = UIImagePickerController()
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func profilePictureFromEmailSwitch(_ sender: Any) {
        if photoFromProfile != nil {
            let url = photoFromProfile
            profileImageview.kf.setImage(with: url)
        }else{
            return
        }
    }
    @IBAction func signOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let error {
            // handle error here
            print("Error trying to sign out of Firebase: \(error.localizedDescription)")
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
         dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        profileImageview.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

