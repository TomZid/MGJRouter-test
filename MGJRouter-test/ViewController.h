//
//  ViewController.h
//  MGJRouter-test
//
//  Created by tom.zhu on 30/08/2017.
//  Copyright © 2017 TZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

+ (void)registWithTitle:(NSString*)title handle:(id(^)())handle;

@end

