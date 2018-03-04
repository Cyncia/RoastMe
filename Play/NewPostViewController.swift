//
//  NewPostViewController.swift
//  RoastMe
//
//  Created by Alexander Chen on 3/2/18.
//  Copyright © 2018 Cynthia Zhou. All rights reserved.
//

import UIKit
import Firebase
import MobileCoreServices

class NewPostViewController: UIViewController {

    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func uploadButtonWasPressed(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(imagePicker, animated: true, completion: nil)
    }
    
    func uploadImageToFirebaseStorage(data: Data) {
        let roastsRef = Storage.storage().reference().child("roasts/test.jpg")
        let uploadMetadata = StorageMetadata()
        uploadMetadata.contentType = "image/jpeg"
        let uploadTask = roastsRef.putData(data, metadata: uploadMetadata, completion: { (metadata, error) in
            if(error != nil) {
                print("I received an error! \(String(describing: error?.localizedDescription))")
            } else {
                print("Upload complete! Here's some metadata! \(String(describing: metadata))")
                //hardcoded userID CHANGE
                
                var url = String(describing: metadata?.downloadURL())
                let start = url.index(url.startIndex, offsetBy: 9)
                let end = url.index(url.endIndex, offsetBy: -1)
                let range = start..<end
                url = url[range]

                createPost(picURL: url)
            }
        })
        //Update progress bar
        uploadTask.observe(.progress) { [weak self] (snapshot) in
            guard let strongSelf = self else { return }
            guard let progress = snapshot.progress else { return }
            strongSelf.progressView.progress = Float(progress.fractionCompleted)
        }
        
        uploadTask.observe(.success) { snapshot in
            self.performSegue(withIdentifier: "goToHomeFromNewPost", sender: self)
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

extension NewPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let mediaType: String = info[UIImagePickerControllerMediaType] as? String else {
            dismiss(animated: true, completion: nil)
            return
        }
        if mediaType == (kUTTypeImage as String) {
            // The user has selected an image
            if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage, let imageData = UIImageJPEGRepresentation(originalImage, 0.8) {
                uploadImageToFirebaseStorage(data: imageData)
            }
        }
        dismiss(animated: true, completion: nil)
    }
}
