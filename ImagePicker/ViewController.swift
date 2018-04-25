//
//  ViewController.swift
//  ImagePicker
//
//  Created by Push_Parn on 25/04/18.
//  Copyright © 2018 Push_Parn. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func PickImage(_ sender: UIButton) {
        //Create a image picker controller object that helps to choose an image.
        let imagePicker = UIImagePickerController()
        //Setting the delegate of imagePicker to self, will notify the ViewController if something changes to it.Similar to tableView.
        imagePicker.delegate = self
        //This creates an AlertController with three actions: Choose Photo From Photo Gallery, From Camera, Cancel the Picking.
       let myActionsheet = UIAlertController(title: "Pick Your Image Source", message: "Choose", preferredStyle: .actionSheet)
        //The handler of each action handles the action and is runned only when the action is dispatched.
        myActionsheet.addAction(UIAlertAction(title: "Photo Gallery", style: .default, handler: { (action:UIAlertAction) in
        // This selects tha sourceType of imagePicker to the required one.
           imagePicker.sourceType = .photoLibrary
        //Presenting the imagePicker
            self.present(imagePicker, animated: true, completion:nil)
        }))
        myActionsheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion:nil)
            }
            else{
                print("Please Add Your Camera")
            }
            
        }))
   
        myActionsheet.addAction(UIAlertAction(title: "Cancel", style: .default
            , handler: { (action:UIAlertAction) in
          print("No Pick")
        }))
        //Presenting the action sheet with three actions
        self.present(myActionsheet, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        for name in info{
            print(name)
            
        }
        //There are three keys in info[] array such as:UIImagePickerControllerImageURL,UIImagePickerControllerMediaType,UIImagePickerControllerOriginalImage
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        // setting the myImageView to selected image
        myImageView.image = image
        picker.dismiss(animated: true, completion: nil)

    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //This is so simple,just to dismiss the image Picker Controller.
        picker.dismiss(animated: true, completion: nil)
    }


}

