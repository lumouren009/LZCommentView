//
//  QQLCommentView.h
//  QQLLiveCommentView
//
//  Created by 卢政 on 16/5/13.
//  Copyright © 2016年 卢政. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZCommentCell.h"
#import "LZCommentConfig.h"
#import "LZCommentMark.h"

@interface LZCommentView : UIView
- (void)setConfig:(LZCommentConfig*)config;
- (LZCommentCell*)addCellwithProfileImage: (UIImage*)profileImage name:(NSString*)name comment:(NSString*)comment;
@end
