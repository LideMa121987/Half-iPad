//
//  HSBaseViewController.m
//  Half
//
//  Created by lide on 15/4/22.
//
//

#import "HSBaseViewController.h"

@interface HSBaseViewController ()
{
    
}

@end

@implementation HSBaseViewController

#pragma mark - private

- (void)clickBackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - super

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _adjustView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.origin.y, self.view.frame.size.width, 64 - self.view.frame.origin.y)];
    _adjustView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_adjustView];
    
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, _adjustView.frame.size.height - 44, _adjustView.frame.size.width, 44)];
    _headView.backgroundColor = [UIColor blackColor];
    [_adjustView addSubview:_headView];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.frame = CGRectMake(2, 2, 40, 40);
    _backButton.backgroundColor = [UIColor cyanColor];
    [_backButton setTitle:@"B" forState:UIControlStateNormal];
    [_backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(clickBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:_backButton];
    
    _parentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _parentImageView.backgroundColor = [UIColor clearColor];
    _parentImageView.hidden = YES;
    [self.view insertSubview:_parentImageView atIndex:0];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(viewControllerDidAdjustView)
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if(self.navigationController != nil && self.navigationController.viewControllers && [self.navigationController.viewControllers indexOfObject:self] > 0)
    {
        UIViewController *viewController = [self.navigationController.viewControllers objectAtIndex:[self.navigationController.viewControllers indexOfObject:self] - 1];
        
        UIGraphicsBeginImageContextWithOptions(viewController.view.frame.size, NO, 0.0);
        CGContextRef contentRef = UIGraphicsGetCurrentContext();
        [viewController.view.layer renderInContext:contentRef];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        _parentImageView.image = image;
        [self.view insertSubview:_parentImageView atIndex:0];
    }
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
    
}

- (void)hideAnimation
{

}

- (void)viewControllerDidAdjustView
{
    if(self.navigationController != nil)
    {
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.navigationController.view.frame.size.width, self.navigationController.view.frame.size.height);
    }
    else
    {
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, ScreenWidth - self.view.frame.origin.x, ScreenHeight - self.view.frame.origin.y);
    }
    
//    NSLog(@"Fuck!");
//    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    
    _adjustView.frame = CGRectMake(0, self.view.frame.origin.y, self.view.frame.size.width, 64 - self.view.frame.origin.y);
    _headView.frame = CGRectMake(0, _adjustView.frame.size.height - 44, _adjustView.frame.size.width, 44);
    _backButton.frame = CGRectMake(2, 2, 40, 40);
    
    _parentImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    if(self.navigationController != nil && self.navigationController.viewControllers && [self.navigationController.viewControllers indexOfObject:self] > 0)
    {
        UIViewController *viewController = [self.navigationController.viewControllers objectAtIndex:[self.navigationController.viewControllers indexOfObject:self] - 1];
        
        UIGraphicsBeginImageContextWithOptions(viewController.view.frame.size, NO, 0.0);
        CGContextRef contentRef = UIGraphicsGetCurrentContext();
        [viewController.view.layer renderInContext:contentRef];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        _parentImageView.image = image;
        [self.view insertSubview:_parentImageView atIndex:0];
    }
}

@end
