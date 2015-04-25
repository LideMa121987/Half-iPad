//
//  HSBaseView.m
//  Half
//
//  Created by lide on 15/4/22.
//
//

#import "HSBaseView.h"

@implementation HSBaseView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self != nil)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(viewDidAdjustSelf)
                                                     name:UIApplicationDidChangeStatusBarOrientationNotification
                                                   object:nil];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [self viewDidAdjustSelf];
}

- (void)viewDidAdjustSelf
{
//    NSLog(@"Fuck!");
//    NSLog(@"%@", NSStringFromCGRect(CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)));
}

@end
