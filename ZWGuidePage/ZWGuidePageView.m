//
//  ZWGuidePageView.m
//  ZWGuidePage
//
//  Created by 崔先生的MacBook Pro on 2022/9/27.
//

#import "ZWGuidePageView.h"
#import "MainViewController.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define img(imageName) [UIImage imageNamed:imageName]

@interface ZWGuidePageView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation ZWGuidePageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor redColor];
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
        self.imageArr = @[@1];
    }
    return self;
}

#pragma mark - delegate

/* 已经停止加速 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.pageControl.currentPage = self.scrollView.contentOffset.x / kWidth;
    if (self.scrollView.contentOffset.x / kWidth == 3) {
        if (self.toNextVC) {
            self.toNextVC();
        }
    }
    
}

#pragma mark - getter setter方法

- (void)setImageArr:(NSArray *)imageArr {
    for (int i = 0; i < 3; i++) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(i * kWidth, 0, kWidth, kHeight)];
        NSString *str = [NSString stringWithFormat:@"%d.jpg", i];
        view.image = img(str);
        [self.scrollView addSubview:view];
    }
}

#pragma mark - 懒加载

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
        _scrollView.contentSize = CGSizeMake(kWidth * 4, kHeight);
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, kHeight - 50, kWidth, 10)];
        _pageControl.numberOfPages = 3;
        _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:1.0];
    }
    return _pageControl;
}

@end
