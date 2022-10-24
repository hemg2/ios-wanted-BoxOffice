//
//  ThirdViewController.swift
//  BoxOffice
//
//  Created by 1 on 2022/10/21.
//

import UIKit


class ThirdViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var nameImage: UIImageView!
    let imgPickerController = UIImagePickerController()
    @IBOutlet weak var idText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var checkPassword: UITextField!
    @IBOutlet weak var check: UIButton!
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBAction func sliderChanged(_ sender: UISlider) {
        let floatValue = floor(sender.value * 10) / 10
        let intValue = Int(floor(sender.value))
        
        for index in 1...5 {
            if let starImage = view.viewWithTag(index) as? UIImageView {
                if Float(index) <= floatValue {
                    starImage.image = UIImage(named: "star_full1")
                }
                else if (Float(index) - floatValue) <= 0.5 {
                    starImage.image = UIImage(named: "star_half")
                }
                else {
                    starImage.image = UIImage(named: "star_empty")
                    
                }
            }
        }
        self.sliderLabel?.text = String(Int(floatValue))
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

    
    @IBAction func touchUpButton(_ sender: UIButton) {
        imgPickerController.sourceType = .photoLibrary
        self.present(imgPickerController, animated: true)
        print("클릭")
        
    }
    
    lazy var rightNavButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "📷", style: .plain, target: self, action: #selector(add))
        return button
    }()
    
   
    
    @objc func add(_ sender: UIButton) {
        let camera = UIImagePickerController()
        camera.delegate = self
        camera.sourceType = .camera
        camera.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera) ?? []
        self.present(camera, animated: true)
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = rightNavButton
        self.idText.delegate = self
        self.passwordText.delegate = self
        self.checkPassword.delegate = self
        imgPickerController.delegate = self
        
        self.idText.addTarget(self, action: #selector(self.changed(_:)), for: .editingChanged)
        self.passwordText.addTarget(self, action: #selector(self.changed(_:)), for: .editingChanged)
        self.checkPassword.addTarget(self, action: #selector(self.changed(_:)), for: .editingChanged)
        
        
    }
    
    func isSameBothTextField(_ first: UITextField, _ second: UITextField) -> Bool {
        if(first.text == second.text) {
            return true
        } else {
            return false
        }
    }
    
    func updateButton(willActiove: Bool) {
        if(willActiove == true) {
            self.check.setTitleColor(UIColor.blue, for: UIControl.State.normal)
            print("yes")
        } else {
            self.check.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            print("no")
        }
    }
    
    @objc func changed(_ sender: UITextField) {
        if !(self.idText.text?.isEmpty ?? true)
            && !(self.passwordText.text?.isEmpty ?? true)
            && isSameBothTextField(passwordText, checkPassword) {
            updateButton(willActiove: true)
        } else {
            updateButton(willActiove: false)
        }
        
    }
   
}
extension ThirdViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.nameImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    
}


