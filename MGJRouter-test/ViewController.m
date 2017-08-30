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
    _titleWithHandlers[title] = handle();
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)title1:(id)sender {
//    [self performSegueWithIdentifier:@"detailSegue" sender:nil];
    NSString *title = _titleArray[0];
    UIViewController *vc = _titleWithHandlers[title];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)title2:(id)sender {
//    [self performSegueWithIdentifier:@"detailSegue" sender:nil];
    NSString *title = _titleArray[1];
    UIViewController *vc = _titleWithHandlers[title];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)title3:(id)sender {
//    [self performSegueWithIdentifier:@"detailSegue" sender:nil];
    NSString *title = _titleArray[2];
    UIViewController *vc = _titleWithHandlers[title];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
