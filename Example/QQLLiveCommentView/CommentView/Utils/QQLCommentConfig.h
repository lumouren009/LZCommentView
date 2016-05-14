//
//  QQLCommentConfig.h
//  QQLLiveCommentView
//
//  Created by 卢政 on 16/5/13.
//  Copyright © 2016年 卢政. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QQLCommentLayout;
@class QQLCommentFont;
@interface QQLCommentConfig : NSObject
@property (nonatomic, strong) QQLCommentLayout *layout;
@property (nonatomic, strong) QQLCommentFont *commentFont;
@property (nonatomic, strong) QQLCommentFont *nameFont;
@property (nonatomic, assign) NSTimeInterval disappearDuration;
@property (nonatomic, assign) NSTimeInterval appearDuration;
+ (instancetype)defaultConfig;
@end

@interface QQLCommentLayout : NSObject
@property (nonatomic, assign) CGFloat markLeftPadding;
@property (nonatomic, assign) CGFloat markNameMargin;
@property (nonatomic, assign) CGFloat nameCommentMargin;
@property (nonatomic, assign) CGFloat padding;
@property (nonatomic, assign) CGFloat cellSpace;
@property (nonatomic, assign) CGFloat maximumWidth;
@property (nonatomic, assign) CGFloat maximumNameWidth;
@property (nonatomic, assign) CGFloat markWidth;
@property (nonatomic, assign) BOOL allowLineBreak;
@property (nonatomic, assign) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *cellBackgroundColor;

- (CGFloat)maxCommentWidth;
@end

@interface QQLCommentFont : NSObject
@property (nonatomic, strong) UIFont* font;
@property (nonatomic, strong) UIColor* color;
- (instancetype)initWithFont:(UIFont*)font color:(UIColor*)color;
@end


@interface QQLCommentLabel : UILabel
@property (nonatomic, assign) BOOL allowLineBreak;
- (instancetype)initWithFrame:(CGRect)frame font:(QQLCommentFont*)font allowLineBreak:(BOOL	)allowLineBreak maxWidth:(CGFloat)maxWidth;

@end



