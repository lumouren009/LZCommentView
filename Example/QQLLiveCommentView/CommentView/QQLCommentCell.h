//
//  QQLCommentCell.h
//  QQLLiveCommentView
//
//  Created by 卢政 on 16/5/13.
//  Copyright © 2016年 卢政. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QQLCommentConfig;
@class QQLCommentMark;
@interface QQLCommentCell : UIView
@property (nonatomic, strong) QQLCommentMark *mark;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UILabel *nameLabel;
- (instancetype)initWithFrame:(CGRect)frame profileImage:(UIImage*)image name:(NSString*)name comment:(NSString*)comment config:(QQLCommentConfig*)config;
@end
