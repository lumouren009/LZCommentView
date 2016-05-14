//
//  QQLCommentMark.m
//  QQLLiveCommentView
//
//  Created by 卢政 on 16/5/13.
//  Copyright © 2016年 卢政. All rights reserved.
//

#import "LZCommentMark.h"

@implementation LZCommentMark {
	UIImageView *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image {
	if (self = [super initWithFrame:frame]) {
		[self setupView:image];
	}
	return self;
}

- (void)setupView:(UIImage *)image {
	_imageView = [[UIImageView alloc]initWithImage:image];
	_imageView.frame = self.frame;
	_imageView.contentMode = UIViewContentModeScaleAspectFill;
	_imageView.layer.cornerRadius = 0.5 * _imageView.frame.size.height;
	[_imageView setClipsToBounds:YES];
	[self addSubview:_imageView];
	
//	UIView *colorView = [[UIView alloc]initWithFrame:self.frame];
//	UIColor *blue = [UIColor colorWithRed:0.12 green:0.59 blue:0.95 alpha:0.7];
//	colorView.backgroundColor = blue;
//	[self addSubview:colorView];
	
}

@end
