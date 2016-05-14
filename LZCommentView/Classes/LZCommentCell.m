//
//  QQLCommentCell.m
//  QQLLiveCommentView
//
//  Created by 卢政 on 16/5/13.
//  Copyright © 2016年 卢政. All rights reserved.
//

#import "LZCommentCell.h"
#import "LZCommentConfig.h"
#import "LZCommentMark.h"


@implementation LZCommentCell

- (instancetype)initWithFrame:(CGRect)frame profileImage:(UIImage*)image name:(NSString*)name comment:(NSString*)comment config:(LZCommentConfig*)config {
	NSParameterAssert(config);
	
	if (self = [super initWithFrame:frame]) {
		
		CGSize markSize = (CGSize){config.layout.markWidth, config.layout.markWidth};
		CGRect markRect = (CGRect){{config.layout.markLeftPadding, 0}, markSize};
		
		self.mark = [[LZCommentMark alloc]initWithFrame:markRect image:image];
		
		CGPoint namePos = CGPointMake(self.mark.frame.origin.x + self.mark.frame.size.width + config.layout.markNameMargin, config.layout.padding);
		
		
		self.nameLabel = [[UILabel alloc]initWithFrame:((CGRect){namePos, {0, 0}})];
		self.nameLabel.font = config.nameFont.font;
		self.nameLabel.textColor = config.nameFont.color;

		self.nameLabel.text = name;
		[self.nameLabel sizeToFit];
		
		CGRect rect = [self.nameLabel.text boundingRectWithSize:CGSizeMake(config.layout.maximumNameWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : config.nameFont.font} context:nil];
		
		CGRect labelFrame = self.nameLabel.frame;
		labelFrame.size.width = rect.size.width;
		self.nameLabel.frame = labelFrame;
		
		CGPoint commentPos = CGPointMake(self.nameLabel.frame.origin.x + self.nameLabel.frame.size.width + config.layout.nameCommentMargin, config.layout.padding);
		
		CGFloat maxCommentWidth = config.layout.maxCommentWidth;
		self.commentLabel = [[LZCommentLabel alloc]initWithFrame:(CGRect){commentPos, CGSizeZero} font:config.commentFont allowLineBreak:config.layout.allowLineBreak maxWidth:maxCommentWidth];
		self.commentLabel.text = comment;
		[self.commentLabel sizeToFit];
		
		
		[self setupView:image name:name comment:comment config:config];
	}
	return self;
}

- (void)setupView:(UIImage*)image name:(NSString*)name comment:(NSString*)comment config:(LZCommentConfig*)config {
	self.backgroundColor = config.layout.cellBackgroundColor;
	self.layer.cornerRadius = 5;
	[self setClipsToBounds:YES];
	
	[self addSubview:self.nameLabel];
	[self addSubview:self.commentLabel];
	[self addSubview:self.mark];

	
	CGFloat inferedWidth = config.layout.markLeftPadding + config.layout.markWidth + config.layout.markNameMargin + self.nameLabel.frame.size.width + config.layout.nameCommentMargin + self.commentLabel.frame.size.width + config.layout.padding * 2 ;
	
	CGFloat width = MIN(inferedWidth, config.layout.maximumWidth);
	
	CGFloat inferredHeight = config.layout.padding * 2 + self.commentLabel.frame.size.height;
	CGFloat height =  MAX(config.layout.markWidth + 2 * config.layout.padding, inferredHeight);
	
	self.frame = (CGRect){CGPointZero, (CGSize){width,height}};
	
	CGPoint markOrigin = {self.mark.frame.origin.x, (self.frame.size.height - self.mark.frame.size.height) / 2};
	self.mark.frame = (CGRect){markOrigin, self.mark.frame.size};
}

@end
