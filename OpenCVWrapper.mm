//
//  OpenCVWrapper.m
//  ToneAdjust
//
//  Created by Orenda M1 on 03/03/25.
//

#import "OpenCVWrapper.h"
#undef NO
#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

using namespace cv;

@implementation OpenCVWrapper

+ (UIImage *)adjustTemperature:(UIImage *)image value:(CGFloat)temperature {

    cv::Mat mat;
    UIImageToMat(image, mat);

    if (mat.empty()) {
        return image;
    }

    cv::Mat lab;
    cvtColor(mat, lab, COLOR_BGR2Lab);

    std::vector<cv::Mat> lab_channels;
    split(lab, lab_channels);

    lab_channels[2] += temperature;

    merge(lab_channels, lab);

    cv::Mat adjustedMat;
    cvtColor(lab, adjustedMat, COLOR_Lab2BGR);

    return MatToUIImage(adjustedMat);
}

@end
