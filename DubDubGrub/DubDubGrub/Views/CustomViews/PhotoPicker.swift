//
//  PhotoPicker.swift
//  DubDubGrub
//
//  Created by Kwangjun Kim on 2022/04/29.
//

import SwiftUI
import UIKit

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var image: UIImage
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let photoPicker: PhotoPicker
        
        init(photoPicker: PhotoPicker) {
            self.photoPicker = photoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                // the basic way of compressed image
                // 1 is 100% compress image, 0 is 0% compress. so, 0.1 == 90%
                guard let compressedImageData = image.jpegData(compressionQuality: 0.1) else {
                    fatalError("compressed image data error")
                }
                
                guard let compressedImage = UIImage(data: compressedImageData) else {
                    fatalError("compressed image error")
                }
                
                photoPicker.image = compressedImage
            }
            
            photoPicker.presentationMode.wrappedValue.dismiss()
        }
    }
}
