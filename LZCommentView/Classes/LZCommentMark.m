//
//  QQLCommentMark.m
//  QQLLiveCommentView
//
//  Created by 卢政 on 16/5/13.
//  Copyright © 2016年 卢政. All rights reserved.
//

#import "LZCommentMark.h"

@interface LZCommentMark ()
@property (nonatomic, readwrite, strong) UIImageView *imageView;
@end

@implementation LZCommentMark 

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

}

@end
