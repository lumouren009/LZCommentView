//
//  QQLCommentView.h
//  QQLLiveCommentView
//
//  Created by 卢政 on 16/5/13.
//  Copyright © 2016年 卢政. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QQLCommentCell;
@class QQLCommentConfig;
@interface QQLCommentView : UIView
- (void)setConfig:(QQLCommentConfig*)config;
- (void)addCellwithProfileImage: (UIImage*)profileImage name:(NSString*)name comment:(NSString*)comment;
@end
