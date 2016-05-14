//
//  ViewController.m
//  QQLLiveCommentView
//
//  Created by 卢政 on 16/5/13.
//  Copyright © 2016年 卢政. All rights reserved.
//

#import "ViewController.h"
#import <LZCommentView/LZCommentView.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet LZCommentView *commentView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self addCells];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)addCells {
	NSString *name = @"yoavlt";
	UIImage *profileImage = [UIImage imageNamed:@"twitterProfile.jpeg"];
	
	__weak __typeof(self) weakSelf = self;
	[self dispatchOnMainThread:1 block:^{
		NSString *comment = @"Awesome!";
		LZCommentCell * cell =
		[weakSelf.commentView addCellwithProfileImage:nil name:name comment:comment];
		[cell.mark.imageView setImage:[UIImage imageNamed:@"twitterProfile.jpeg"]];
	}];
	
	[self dispatchOnMainThread:2 block:^{
		NSString *comment = @"Hooooo!";
		[weakSelf.commentView addCellwithProfileImage:profileImage name:@"Alonsolu Alonsolu Alonsolu" comment:comment];
	}];
	
	
	[self dispatchOnMainThread:3 block:^{
		NSString *comment = @"fdfaljdfldjfladsj dfajdslfjadsfja fadsflasdjfals!";
		[weakSelf.commentView addCellwithProfileImage:profileImage name:name comment:comment];
	}];
	
	[self dispatchOnMainThread:4 block:^{
		NSString *comment = @"一二三四lsds dfsdl fddfjadl jdlfad!";
		[weakSelf.commentView addCellwithProfileImage:profileImage name:name comment:comment];
	}];
	
	
}



- (void)dispatchOnMainThread:(NSTimeInterval)delay block:(void(^)())block {
	if (delay == 0) {
		dispatch_async(dispatch_get_main_queue(), ^{
			block();
		});
		return;
	}
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * (double)NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		block();
	});
}




@end
