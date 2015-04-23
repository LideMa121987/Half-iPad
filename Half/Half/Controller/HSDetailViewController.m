//
//  HSDetailViewController.m
//  Half
//
//  Created by Lide on 15/4/24.
//
//

#import "HSDetailViewController.h"

@interface HSDetailViewController ()
{
    UIView      *_backgroundView;
    UIView      *_contentView;
}

@end

@implementation HSDetailViewController

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
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(100, 0, self.view.frame.size.width - 100, self.view.frame.size.height)];
    _contentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_contentView];
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

- (void)viewControllerDidAdjustView
{
    [super viewControllerDidAdjustView];
    
    _backgroundView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _contentView.frame = CGRectMake(100, 0, self.view.frame.size.width - 100, self.view.frame.size.height);
}

#pragma mark - UIGestureRecognizer

- (void)tapBackgroundView:(UITapGestureRecognizer *)gestureRecognizer
{
    if(gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        [self.navigationController popViewControllerAnimated:NO];
    }
}

@end
