//
//  HSSettingHomeViewController.m
//  Half
//
//  Created by Lide on 15/4/25.
//
//

#import "HSSettingHomeViewController.h"

@interface HSSettingHomeViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView     *_tableView;
}

@end

@implementation HSSettingHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _adjustView.hidden = YES;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
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

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return 3;
        }
            break;
        case 1:
        {
            return 2;
        }
            break;
        default:
        {
            return 0;
        }
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HSSettingViewControllerIdentifier"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HSSettingViewControllerIdentifier"];
    }
    
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    cell.textLabel.text = @"分享应用";
                }
                    break;
                case 1:
                {
                    cell.textLabel.text = @"我要投稿";
                }
                    break;
                case 2:
                {
                    cell.textLabel.text = @"意见反馈";
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    cell.textLabel.text = @"清空缓存";
                }
                    break;
                case 1:
                {
                    cell.textLabel.text = @"关于";
                }
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                
                }
                    break;
                case 1:
                {
                
                }
                    break;
                case 2:
                {
                
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                
                }
                    break;
                case 1:
                {
                
                }
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
    return nil;
}

@end
