//
//  HLBrightness.m
//  Jian24
//
//  Created by 刘豪亮 on 2017/7/5.
//  Copyright © 2017年 Jian24. All rights reserved.
//

#import "HLBrightness.h"

static CGFloat _currentBrightness;
static NSOperationQueue *_queue;

@implementation HLBrightness

+ (void)initialize{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveDefaultBrightness) name:UIScreenBrightnessDidChangeNotification object:nil];
    [self saveDefaultBrightness];
}

+ (void)saveDefaultBrightness{
    _currentBrightness = [UIScreen mainScreen].brightness;
}

+ (void)graduallySetBrightness:(CGFloat)value{
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = 1;
    }
    [_queue cancelAllOperations];
    
    CGFloat brightness = [UIScreen mainScreen].brightness;
    CGFloat step = 0.005 * ((value > brightness) ? 1 : -1);
    int times = fabs((value - brightness) / 0.005);
    for (CGFloat i = 1; i < times + 1; i++) {
        [_queue addOperationWithBlock:^{
            [NSThread sleepForTimeInterval:1 / 180.0];
            [UIScreen mainScreen].brightness = brightness + i * step;
        }];
    }
}

+ (void)graduallyResumeBrightness{
    [self graduallySetBrightness:_currentBrightness];
}

+ (void)resumeBrightness{
    [UIScreen mainScreen].brightness = _currentBrightness;
}

@end

