//
//  HSBaseViewController.m
//  Half
//
//  Created by metao on 15/4/22.
//
//

#import "HSBaseViewController.h"

@interface HSBaseViewController ()

@end

@implementation HSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(viewControllerDidAdjustView)
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification
                                               object:nil];
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
    NSLog(@"Fuck!");
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
}

@end
