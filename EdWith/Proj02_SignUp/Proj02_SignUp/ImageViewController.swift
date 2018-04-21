//
//  ImageViewController.swift
//  Proj02_SignUp
//
//  Created by KimSuyoung on 2018. 4. 20..
//  Copyright © 2018년 KimSuyoung. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    lazy var imagePicker: UIImagePickerController =  {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUpSelecteImageButton(_ sender: UIButton) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let originalImage: UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }

}
