//
//  ViewController.m
//  MGJRouter-test
//
//  Created by tom.zhu on 30/08/2017.
//  Copyright © 2017 TZ. All rights reserved.
//

#import "ViewController.h"

static NSMutableArray *_titleArray;
static NSMutableDictionary *_titleWithHandlers;
@interface ViewController ()

@end

@implementation ViewController
+ (void)registWithTitle:(NSString*)title handle:(id(^)())handle {
    if (!_titleArray) {
        _titleArray = [NSMutableArray array];
        _titleWithHandlers = [NSMutableDictionary dictionary];
    }
    
    [_titleArray addObject:title];
    _titleWithHandlers[title] = handle;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)title1:(id)sender {
    NSString *title = _titleArray[0];
    UIViewController *vc = ((id(^)())_titleWithHandlers[title])();
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)title2:(id)sender {
    NSString *title = _titleArray[1];
    UIViewController *vc = ((id(^)())_titleWithHandlers[title])();
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)title3:(id)sender {
    NSString *title = _titleArray[2];
    UIViewController *vc = ((id(^)())_titleWithHandlers[title])();
    [self.navigationController pushViewController:vc animated:YES];
}

@end
