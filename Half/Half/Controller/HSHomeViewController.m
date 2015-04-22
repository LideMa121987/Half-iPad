//
//  HSHomeViewController.m
//  Half
//
//  Created by metao on 15/4/22.
//
//

#import "HSHomeViewController.h"
#import "SMGridView.h"
#import "HSBaseView.h"

@interface HSHomeViewController () <SMGridViewDataSource, SMGridViewDelegate>
{
    SMGridView      *_gridView;
    UIView          *_gridHeaderView;
}

@end

@implementation HSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _gridView = [[SMGridView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _gridView.padding = 15;
    _gridView.vertical = YES;
    _gridView.dataSource = self;
    _gridView.gridDelegate = self;
    [self.view addSubview:_gridView];
    
    _gridHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _gridView.frame.size.width, _gridView.frame.size.height / 4)];
    _gridHeaderView.backgroundColor = [UIColor blueColor];
    
    [self viewControllerDidAdjustView];
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
    
    _gridView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _gridHeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * 9 / 16);
    
    if(IsPortrait)
    {
        _gridView.numberOfRows = 2;
    }
    else
    {
        _gridView.numberOfRows = 3;
    }
    
    [_gridView reloadData];
}

#pragma mark - SMGridViewDataSource

- (NSInteger)smGridView:(SMGridView *)gridView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (CGSize)smGridView:(SMGridView *)gridView sizeForIndexPath:(NSIndexPath *)indexPath
{
    if(IsPortrait)
    {
        return CGSizeMake((gridView.frame.size.width - 15 * 3) / 2, (gridView.frame.size.width - 15 * 3) * 3 / 8);
    }
    else
    {
        return CGSizeMake((gridView.frame.size.width - 15 * 4) / 3, (gridView.frame.size.width - 15 * 4) / 4);
    }
}

- (UIView *)smGridView:(SMGridView *)gridView viewForIndexPath:(NSIndexPath *)indexPath
{
    UIView *view = [gridView dequeReusableView];
    if(view == nil)
    {
        view = [[HSBaseView alloc] init];
        view.backgroundColor = [UIColor redColor];
    }
    
    if(IsPortrait)
    {
        CGSize size = CGSizeMake((gridView.frame.size.width - 15 * 3) / 2, (gridView.frame.size.width - 15 * 3) * 3 / 8);
        view.frame = CGRectMake(0, 0, size.width, size.height);
    }
    else
    {
        CGSize size = CGSizeMake((gridView.frame.size.width - 15 * 4) / 3, (gridView.frame.size.width - 15 * 4) / 4);
        view.frame = CGRectMake(0, 0, size.width, size.height);
    }
    
    return view;
}

- (NSInteger)numberOfSectionsInSMGridView:(SMGridView *)gridView
{
    return 1;
}

- (CGSize)smGridView:(SMGridView *)gridView sizeForHeaderInSection:(NSInteger)section
{
    return _gridHeaderView.frame.size;
}

- (UIView *)smGridView:(SMGridView *)gridView viewForHeaderInSection:(NSInteger)section
{
    return _gridHeaderView;
}

#pragma mark - SMGridViewDelegate

@end
