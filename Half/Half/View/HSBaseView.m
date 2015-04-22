//
//  HSBaseView.m
//  Half
//
//  Created by metao on 15/4/22.
//
//

#import "HSBaseView.h"

@implementation HSBaseView

- (id)init
{
    self = [super init];
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

- (void)viewDidAdjustSelf
{
    NSLog(@"Fuck!");
    NSLog(@"%@", NSStringFromCGRect(CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)));
}

@end
