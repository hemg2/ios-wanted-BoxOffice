//
//  imageViewController.swift
//  BoxOffice
//
//  Created by 1 on 2022/10/24.
//

import UIKit

class imageViewController: UIViewController {
    
    let picker = UIImagePickerController()
    
    @IBOutlet weak var testiamge: UIImageView!
    
  
    
    @IBAction func test(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        print("클릭중")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        
    }
    
    func openLibrary() {
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    func openCamera() {
        picker.sourceType = .camera
        present(picker, animated: false)
    }
}

extension imageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.testiamge.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    
}
