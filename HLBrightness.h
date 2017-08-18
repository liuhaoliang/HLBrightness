//
//  HLBrightness.h
//  Jian24
//
//  Created by 刘豪亮 on 2017/7/5.
//  Copyright © 2017年 Jian24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLBrightness : NSObject
/**
 @method
 @abstract 逐步设置亮度
 */
+ (void)graduallySetBrightness:(CGFloat)value;

/**
 @method
 @abstract 逐步恢复亮度
 */
+ (void)graduallyResumeBrightness;

/**
 迅速恢复亮度
 */
+ (void)resumeBrightness;
@end
