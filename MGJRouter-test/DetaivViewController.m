//
//  DetaivViewController.m
//  MGJRouter-test
//
//  Created by tom.zhu on 30/08/2017.
//  Copyright © 2017 TZ. All rights reserved.
//

#import "DetaivViewController.h"
#import "ViewController.h"
#import <MGJRouter.h>

@interface DetaivViewController ()
{
    __weak IBOutlet UILabel *_label;
}
@property (nonatomic) SEL selectedSelector;
@end

@implementation DetaivViewController
+ (void)load {
    [super load];
    DetaivViewController *vc = [[DetaivViewController alloc] init];
    [ViewController registWithTitle:@"title-1" handle:^id{
        vc.selectedSelector = @selector(title1);
        return vc;
    }];
    [ViewController registWithTitle:@"title-2" handle:^id{
        vc.selectedSelector = @selector(title2);
        return vc;
    }];
    [ViewController registWithTitle:@"title-3" handle:^id{
        vc.selectedSelector = @selector(title3);
        return vc;
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([self respondsToSelector:self.selectedSelector]) {
        [self performSelector:self.selectedSelector withObject:nil afterDelay:0];
    }
}

- (void)func:(NSString*)str {
    self->_label.text = str;
    self.title = str;
}

- (void)title1 {
    [MGJRouter registerURLPattern:@"mgj://foo/bar" toHandler:^(NSDictionary *routerParameters) {
        [self func:@"title1"];
    }];
    [MGJRouter openURL:@"mgj://foo/bar"];
}

- (void)title2 {
    
}

- (void)title3 {
    
}

@end
