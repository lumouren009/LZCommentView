//
//  QQLCommentView.m
//  QQLLiveCommentView
//
//  Created by 卢政 on 16/5/13.
//  Copyright © 2016年 卢政. All rights reserved.
//

#import "LZCommentView.h"

@interface LZCommentView ()
@property (nonatomic, strong) LZCommentConfig *config;
@property (nonatomic, strong) NSMutableArray<LZCommentCell*> *visibleCells;
@end

@implementation LZCommentView
- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self commonInit];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		[self commonInit];
	}
	return self;
}

- (void)commonInit {
	_config = [LZCommentConfig defaultConfig];
	_visibleCells = [NSMutableArray new];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
	[super willMoveToSuperview:newSuperview];
	[self setupView];
}

- (void)setupView {
	self.backgroundColor = _config.layout.backgroundColor;
}

#pragma mark - public
- (void)setConfig:(LZCommentConfig *)config {
	_config = config;
}

- (void)addCell: (LZCommentCell*)cell {
	cell.frame = (CGRect) {{0, self.frame.size.height}, cell.frame.size};
	[_visibleCells addObject:cell];
	[self addSubview:cell];
	
	__weak __typeof(self) weakSelf = self;
	[UIView animateWithDuration:_config.appearDuration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
		CGFloat dy = cell.frame.size.height + weakSelf.config.layout.cellSpace;
		for (LZCommentCell *cell in self.visibleCells) {
			CGAffineTransform origin = cell.transform;
			CGAffineTransform  transform = CGAffineTransformMakeTranslation(0, -dy);
			cell.transform = CGAffineTransformConcat(origin, transform);
		}
	} completion:nil];
	
	
	[UIView animateWithDuration:self.config.disappearDuration delay:self.config.appearDuration options:UIViewAnimationOptionCurveEaseIn animations:^{
		cell.alpha = 0.0;
	} completion:^(BOOL finished) {
		[cell removeFromSuperview];
		[weakSelf.visibleCells removeObjectAtIndex:[self.visibleCells indexOfObject:cell]];
	}];
	
}

- (LZCommentCell*)addCellwithProfileImage: (UIImage*)profileImage name:(NSString*)name comment:(NSString*)comment {
	NSCAssert(_config, @"config property should not be nil");
	
	CGRect rect = CGRectZero;
	LZCommentCell *cell = [[LZCommentCell alloc]initWithFrame:rect profileImage:profileImage name:name comment:comment config:_config];
	[self addCell:cell];
	return cell;
}


@end
