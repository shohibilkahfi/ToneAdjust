//
//  OpenCVWrapper.h
//  ToneAdjust
//
//  Created by Orenda M1 on 03/03/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OpenCVWrapper : NSObject

+ (UIImage *)adjustTemperature:(UIImage *)image value:(CGFloat)temperature;

@end

