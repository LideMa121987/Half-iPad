//
//  HSHomeGridView.h
//  Half
//
//  Created by Lide on 15/4/24.
//
//

#import "HSBaseView.h"

@protocol HSHomeGridViewDelegate;

@interface HSHomeGridView : HSBaseView
{
    id<HSHomeGridViewDelegate>  _delegate;
    
    UIView      *_contentView;
    UIImageView *_photoImageView;
    UILabel     *_titleLabel;
    UILabel     *_contentLabel;
    UIButton    *_likeButton;
}

@property (nonatomic) id<HSHomeGridViewDelegate> delegate;

@end

@protocol HSHomeGridViewDelegate <NSObject>

- (void)homeGridViewDidTapContentView:(HSHomeGridView *)homeGridView;

@end
