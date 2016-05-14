//
//  QQLCommentConfig.m
//  QQLLiveCommentView
//
//  Created by 卢政 on 16/5/13.
//  Copyright © 2016年 卢政. All rights reserved.
//

#import "LZCommentConfig.h"


@implementation LZCommentConfig
+ (instancetype)defaultConfig {
	return [[self.class alloc]initWithDefault];
}

- (instancetype)initWithDefault {
	if (self = [super init]) {
		_layout = [[LZCommentLayout alloc] init];
		_commentFont = [[LZCommentFont alloc]initWithFont:[UIFont systemFontOfSize:15] color:[UIColor whiteColor]];
		_nameFont =  [[LZCommentFont alloc]initWithFont:[UIFont systemFontOfSize:13] color:[UIColor whiteColor]];
		
		_disappearDuration = 6.0;
		_appearDuration = 1.0;
		
	}
	return self;
}

@end


@implementation LZCommentLayout

- (instancetype)init {
	if (self = [super init]) {
		_markLeftPadding = 3.0;
		_markNameMargin = 8.0;
		_nameCommentMargin = 5.0;
		_padding = 5;
		_maximumWidth = 300;
		_maximumNameWidth = 50;
		_markWidth = 30.0;
		_allowLineBreak = YES;
		_backgroundColor = [UIColor clearColor];
		_cellBackgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
		_cellSpace = 4.0;
	}
	return self;
}

- (CGFloat)maxCommentWidth {
	return _maximumWidth - (_markLeftPadding + _markWidth + _markNameMargin + _maximumNameWidth + _nameCommentMargin + _padding * 2);
}

@end

@implementation LZCommentFont

- (instancetype)initWithFont:(UIFont*)font color:(UIColor*)color {
	if (self = [super init]) {
		_font = font;
		_color = color;
	}
	return self;
}

@end

@implementation LZCommentLabel {
	CGFloat _maxCommentWidth;
}

- (instancetype)initWithFrame:(CGRect)frame font:(LZCommentFont*)font allowLineBreak:(BOOL	)allowLineBreak maxWidth:(CGFloat)maxWidth {
	if (self = [super initWithFrame:frame]) {
		_allowLineBreak = allowLineBreak;
		_maxCommentWidth = maxWidth;
		self.textColor = font.color;
		self.font = font.font;
	}
	return self;
}

#pragma mark - override
- (void)sizeToFit {
	if (self.allowLineBreak) {
		self.lineBreakMode = NSLineBreakByWordWrapping;
		self.numberOfLines = 0;
	}
	[super sizeToFit];
	self.frame = (CGRect){self.frame.origin, CGSizeMake(MIN(_maxCommentWidth, self.frame.size.width), self.frame.size.height)};
	[super sizeToFit];
}

@end