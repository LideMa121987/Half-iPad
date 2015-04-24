//
//  HSBaseViewController.h
//  Half
//
//  Created by lide on 15/4/22.
//
//

#import <UIKit/UIKit.h>

@interface HSBaseViewController : UIViewController
{
    UIView      *_adjustView;
    UIView      *_headView;
    
    UIImageView     *_parentImageView;
}

- (void)showAnimation;
- (void)hideAnimation;

- (void)viewControllerDidAdjustView;

@end
