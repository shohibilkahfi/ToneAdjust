//
//  ContentView.swift
//  ToneAdjust
//
//  Created by Orenda M1 on 03/03/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    
    var body: some View {
        VStack {
            if let image = vm.processedImage ?? vm.inputImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding()
            } else {
                Text("Select an image, so you can adjust the color!")
                    .font(.headline)
                    .foregroundStyle(.gray)
                    .padding()
                Button { vm.showingImagePicker = true } label: {
                    Image(systemName: "plus.square.fill.on.square.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray.opacity(0.2)))
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 2))
                }
                .buttonStyle(.plain)
            }
            
            VStack {
                Text("Adjust Temperature")
                Slider(value: $vm.temperature, in: -50...50, step: 1)
                    .padding()
                    .onChange(of: vm.temperature, { _, _ in
                        vm.processImage()
                    })
            }
            
            HStack {
                Button("Remove Image", action: vm.removeImage)
                    .buttonStyle(.bordered)
                
                Button("Reset Edit", action: vm.resetEdit)
                    .disabled(vm.inputImage == nil)
                    .buttonStyle(.borderedProminent)
            }
            .padding()
            Button("Save", action: vm.saveImage)
                .disabled(vm.processedImage == nil || vm.inputImage == nil)
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)
                .alert("Image Save Status", isPresented: $vm.showAlert) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text(vm.alertMessage)
                }
        }
        .sheet(isPresented: $vm.showingImagePicker) {
            ImagePicker(image: $vm.inputImage, viewModel: vm)
        }
        .alert("Error", isPresented: $vm.showImageError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(vm.imageErrorMessage)
        }
    }
}
