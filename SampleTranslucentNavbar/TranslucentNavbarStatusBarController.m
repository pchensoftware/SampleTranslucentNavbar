//
//  TranslucentNavbarStatusBarController.m
//  SampleTranslucentNavbar
//
//  Created by Peter Chen on 12/18/13.
//  Copyright (c) 2013 Peter Chen. All rights reserved.
//

#import "TranslucentNavbarStatusBarController.h"

@interface TranslucentNavbarStatusBarController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation TranslucentNavbarStatusBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Translucent Navbar";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.alwaysBounceVertical = YES;
    self.scrollView.showsVerticalScrollIndicator = YES;
    self.scrollView.backgroundColor = [UIColor grayColor];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.scrollView];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:redView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.translucent = YES;
    self.wantsFullScreenLayout = YES;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackTranslucent;
}

@end
