//
//  OptionsTableController.m
//  SampleTranslucentNavbar
//
//  Created by Peter Chen on 12/18/13.
//  Copyright (c) 2013 Peter Chen. All rights reserved.
//

#import "OptionsTableController.h"
#import "NormalNavbarController.h"
#import "TranslucentNavbarController.h"
#import "TranslucentNavbarStatusBarController.h"

typedef NS_ENUM(int, TableRow) {
    TableRow_Normal,
    TableRow_TranslucentNavbar,
    TableRow_TranslucentNavbarStatusBar,
    TableRow_Count,
};

@interface OptionsTableController ()

@end

@implementation OptionsTableController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return TableRow_Count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    if (indexPath.row == TableRow_Normal) {
        cell.textLabel.text = @"Normal Navbar";
    }
    else if (indexPath.row == TableRow_TranslucentNavbar) {
        cell.textLabel.text = @"Translucent Navbar";
    }
    else if (indexPath.row == TableRow_TranslucentNavbarStatusBar) {
        cell.textLabel.text = @"Translucent Nav + Status Bars";
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == TableRow_Normal) {
        NormalNavbarController *controller = [[NormalNavbarController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if (indexPath.row == TableRow_TranslucentNavbar) {
        TranslucentNavbarController *controller = [[TranslucentNavbarController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if (indexPath.row == TableRow_TranslucentNavbarStatusBar) {
        TranslucentNavbarStatusBarController *controller = [[TranslucentNavbarStatusBarController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
