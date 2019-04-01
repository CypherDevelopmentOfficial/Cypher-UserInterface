    import UIKit
    
    import Photos
    
    import Foundation
    
    class UploadImageViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
        
        @IBOutlet weak var imgView: UIImageView!
        let imagePicker = UIImagePickerController()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            checkPermission()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
        }
        
        @IBAction func btnSetProfileImageClickedCamera(_ sender: UIButton) {
            
        }
        
        @IBAction func btnSetProfileImageClickedFromGallery(_ sender: UIButton) {
            self.selectPhotoFromGallery()
        }
        
        func selectPhotoFromGallery() {
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                self.imgView.contentMode = .scaleAspectFit
                self.imgView.image = pickedImage
            }
            
            dismiss(animated: true, completion: nil)
        }
        
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
            print("cancel is clicked")
        }
        
        
        func checkPermission() {
            let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
            switch photoAuthorizationStatus {
            case .authorized:
                print("Access is granted by user")
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization({
                    (newStatus) in
                    print("status is \(newStatus)")
                    if newStatus ==  PHAuthorizationStatus.authorized {
                        /* do stuff here */
                        print("success")
                    }
                })
                print("It is not determined until now")
            case .restricted:
                // same same
                print("User do not have access to photo album.")
            case .denied:
                // same same
                print("User has denied the permission.")
            @unknown default:
                print("What did just happen? it seems a unaccepted value jumped up.")
            }
        }
    }
