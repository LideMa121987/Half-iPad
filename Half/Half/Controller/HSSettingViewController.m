//
//  HSSettingViewController.m
//  Half
//
//  Created by Lide on 2015/04/24.
//
//

#import "HSSettingViewController.h"

@interface HSSettingViewController ()
{
    UIView      *_backgroundView;
    UIView      *_contentView;
}

@end

@implementation HSSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor clearColor];
    _adjustView.hidden = YES;
    _parentImageView.hidden = NO;
    
    _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    [self.view addSubview:_backgroundView];
    
    UITapGestureRecognizer *oneFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackgroundView:)];
    [_backgroundView addGestureRecognizer:oneFingerTap];
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(200, 200, self.view.frame.size.width - 200 * 2, self.view.frame.size.height - 200 * 2)];
    _contentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_contentView];
    
    [self showAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)showAnimation
{
    _backgroundView.alpha = 0;
    _contentView.transform = CGAffineTransformMake(0, 0, 0, 0, 0, 0);
    
    [UIView animateWithDuration:0.35
                     animations:^{
                         
                         _backgroundView.alpha = 1;
                         _contentView.transform = CGAffineTransformIdentity;
                         
                     } completion:^(BOOL finished) {
                         
                     }];
}

- (void)hideAnimation
{
    [UIView animateWithDuration:0.35
                     animations:^{
                         
                         _backgroundView.alpha = 0;
                         _contentView.transform = CGAffineTransformMake(0, 0, 0, 0, 0, 0);
                         
                     } completion:^(BOOL finished) {
                         
                         [self.navigationController popViewControllerAnimated:NO];
                         
                     }];
}

- (void)viewControllerDidAdjustView
{
    [super viewControllerDidAdjustView];
    
    _backgroundView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _contentView.frame = CGRectMake(200, 200, self.view.frame.size.width - 200 * 2, self.view.frame.size.height - 200 * 2);
}

#pragma mark - UIGestureRecognizer

- (void)tapBackgroundView:(UITapGestureRecognizer *)gestureRecognizer
{
    if(gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        [self hideAnimation];
    }
}

@end
