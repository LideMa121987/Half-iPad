//
//  HSHomeGridView.m
//  Half
//
//  Created by Lide on 15/4/24.
//
//

#import "HSHomeGridView.h"

@implementation HSHomeGridView

@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self != nil)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(4, 4, self.frame.size.width - 4 * 2, self.frame.size.height - 4 * 2)];
        _contentView.backgroundColor = [UIColor clearColor];
        [self addSubview:_contentView];
        
        UITapGestureRecognizer *oneFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapContentView:)];
        [_contentView addGestureRecognizer:oneFingerTap];
        
        _photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _contentView.frame.size.width, _contentView.frame.size.width / 2)];
        _photoImageView.backgroundColor = [UIColor brownColor];
        [_contentView addSubview:_photoImageView];
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
    [super viewDidAdjustSelf];
    
    _contentView.frame = CGRectMake(4, 4, self.frame.size.width - 4 * 2, self.frame.size.height - 4 * 2);
    _photoImageView.frame = CGRectMake(0, 0, _contentView.frame.size.width, _contentView.frame.size.width / 2);
}

#pragma mark - UIGestureRecognizer

- (void)tapContentView:(UITapGestureRecognizer *)gestureRecognizer
{
    if(gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        if(_delegate && [_delegate respondsToSelector:@selector(homeGridViewDidTapContentView:)])
        {
            [_delegate homeGridViewDidTapContentView:self];
        }
    }
}

@end
