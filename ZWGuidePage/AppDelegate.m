//
//  AppDelegate.m
//  ZWGuidePage
//
//  Created by 崔先生的MacBook Pro on 2022/9/27.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    MainViewController *mainVC = [MainViewController new];
    ViewController *vc = [ViewController new];
    if ([self readData]) {
        self.window.rootViewController = mainVC;
    } else {
        self.window.rootViewController = vc;
        vc.block = ^{
            NSLog(@"修改根控制器");
            self.window.rootViewController = mainVC;
        };
    }
    
    return YES;
}

- (BOOL)readData {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filename = [path stringByAppendingPathComponent:@"created.plist"];   //获取路径
    
    NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:filename];  //读取数据
    NSLog(@"dic is:%@",dic);
    
    //创建一个dic，写到plist文件里
    if (!dic) {
        NSDictionary* newDic = [NSDictionary new];
        newDic = [NSDictionary dictionaryWithObject:@"isCreated" forKey:@"created"];
        [newDic writeToFile:filename atomically:YES];
        return NO;
    } else {
        return YES;
    }
}

@end
