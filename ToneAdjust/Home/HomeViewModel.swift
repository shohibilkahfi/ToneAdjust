//
//  HomeViewModel.swift
//  ToneAdjust
//
//  Created by Orenda M1 on 04/03/25.
//

import Foundation
import Photos

class HomeViewModel: NSObject, ObservableObject {
    @Published var inputImage: UIImage? = nil
    @Published var processedImage: UIImage? = nil
    @Published var temperature: CGFloat = 0.0
    @Published var showingImagePicker = false
    @Published var showAlert = false
    @Published var alertMessage = ""
    @Published var showImageError = false
    @Published var imageErrorMessage = ""
    
    // MARK: - Process Image
    func processImage() {
        guard let image = inputImage else { return }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let adjustedImage = OpenCVWrapper.adjustTemperature(image, value: self.temperature)
            
            DispatchQueue.main.async {
                if adjustedImage != image {
                    self.processedImage = adjustedImage
                }
            }
        }
    }
    
    // MARK: - Reset Adjustments
    func resetEdit() {
        temperature = 0
        processImage()
    }
    
    // MARK: - Remove Image
    func removeImage() {
        inputImage = nil
        processedImage = nil
        temperature = 0
    }
    
    // MARK: - Save Image
    func saveImage() {
        guard let image = processedImage else { return }
        
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                if status == .authorized {
                    UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.imageSaved(_:didFinishSavingWithError:contextInfo:)), nil)
                } else {
                    self.alertMessage = "Permission denied. Enable access in Settings."
                    self.showAlert = true
                }
            }
        }
    }
    
    @objc private func imageSaved(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        DispatchQueue.main.async {
            if let error = error {
                self.alertMessage = "Failed to save image: \(error.localizedDescription)"
            } else {
                self.alertMessage = "Image saved successfully!"
                self.removeImage()
            }
            self.showAlert = true
        }
    }
}
