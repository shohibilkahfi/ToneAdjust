# ToneAdjust: iOS App for Adjusting Image Color Temperature

## 📌 Overview
ToneAdjust is an iOS application that allows users to adjust the color temperature of JPEG images using OpenCV and SwiftUI. The app provides an intuitive UI to load, modify, and save images while maintaining high quality.

## 🚀 Features
- Load JPEG images from the device.
- Adjust the color temperature (warmer/cooler) using OpenCV.
- Save the adjusted image in high quality.
- SwiftUI-based modern user interface.

## 🛠️ Requirements
- Xcode 15 or later
- iOS 17 or later
- Swift
- SwiftUI
- OpenCV framework

## 🔧 Setup Guide
### 1️⃣ Clone the Repository
```sh
git clone https://github.com/shohibilkahfi/ToneAdjust.git
cd ToneAdjust
```

### 2️⃣ Install OpenCV Framework
Since `opencv2.framework/` is not included in the repository, you need to add it manually:

1. Download OpenCV for iOS from the official OpenCV website:  
   [https://opencv.org/releases/](https://opencv.org/releases/)
2. Extract the downloaded file and locate `opencv2.framework`.
3. Copy `opencv2.framework` to your Xcode project's `Frameworks` directory.
4. In Xcode, go to **Project Navigator → Frameworks**, and drag `opencv2.framework` into it.
5. Ensure that it is added to **Frameworks, Libraries, and Embedded Content** in **Project Settings**.

### 3️⃣ Install Dependencies (If Any)
If the project uses Swift Package Manager (SPM), run:
```sh
swift package update
```

### 4️⃣ Build and Run
Open `ToneAdjust.xcodeproj` in Xcode and build/run the project on a simulator or a real device.

## 🖼️ Usage
1. Open the app and select a JPEG image from your device.
2. Use the slider to adjust the image temperature.
3. Preview the changes in real time.
4. If needed, remove the selected image and choose a new one.
5. Use the reset button to revert edits back to the original image.
6. Save the adjusted image to your device.

## 🤝 Contribution
Feel free to contribute by submitting issues or pull requests. Make sure to follow the coding guidelines.

## 📜 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

💡 **Need Help?** If you run into any issues, please open an issue on GitHub!

