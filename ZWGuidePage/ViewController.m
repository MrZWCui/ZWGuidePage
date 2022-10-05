//
//  ViewController.m
//  ZWGuidePage
//
//  Created by 崔先生的MacBook Pro on 2022/9/27.
//

#import "ViewController.h"
#import "ZWGuidePageView.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    ZWGuidePageView *guidePage = [[ZWGuidePageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    [self.view addSubview:guidePage];
    
    guidePage.toNextVC = ^{
        if (self.block) {
            self.block();
        }
    };
}


@end
