//
//  QQLCommentView.m
//  QQLLiveCommentView
//
//  Created by 卢政 on 16/5/13.
//  Copyright © 2016年 卢政. All rights reserved.
//

#import "QQLCommentView.h"
#import "QQLCommentConfig.h"
#import "QQLCommentCell.h"

@interface QQLCommentView ()
@property (nonatomic, strong) QQLCommentConfig *config;
@property (nonatomic, strong) NSMutableArray<QQLCommentCell*> *visibleCells;
@end

@implementation QQLCommentView
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
	_config = [QQLCommentConfig defaultConfig];
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
- (void)setConfig:(QQLCommentConfig *)config {
	_config = config;
}

- (void)addCell: (QQLCommentCell*)cell {
	cell.frame = (CGRect) {{0, self.frame.size.height}, cell.frame.size};
	[_visibleCells addObject:cell];
	[self addSubview:cell];
	
	__weak __typeof(self) weakSelf = self;
	[UIView animateWithDuration:_config.appearDuration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
		CGFloat dy = cell.frame.size.height + weakSelf.config.layout.cellSpace;
		for (QQLCommentCell *cell in self.visibleCells) {
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

- (void)addCellwithProfileImage: (UIImage*)profileImage name:(NSString*)name comment:(NSString*)comment {
	NSCAssert(_config, @"config property should not be nil");
	
	CGRect rect = CGRectZero;
	QQLCommentCell *cell = [[QQLCommentCell alloc]initWithFrame:rect profileImage:profileImage name:name comment:comment config:_config];
	[self addCell:cell];
}


@end
