//
//  ZWGuidePageView.h
//  ZWGuidePage
//
//  Created by 崔先生的MacBook Pro on 2022/9/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWGuidePageView : UIView

@property (nonatomic, strong) NSArray *imageArr;
@property (nonatomic, strong) void(^toNextVC)(void);

@end

NS_ASSUME_NONNULL_END
