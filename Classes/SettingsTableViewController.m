//
//  SettingsTableViewController.m
//  TwitterPhox
//
//  Created by kaz on 7/14/08.
//  Copyright 2008 naan studio. All rights reserved.
//

#import "SettingsTableViewController.h"

@implementation SettingsTableViewController

#define LABEL_TAG     1
#define TEXTFIELD_TAG 2

- (void)viewDidLoad
{
	[super viewDidLoad];

    // If the settings are empty, focus to username text area.
	NSString *username = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
	NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    if (username == nil) {
        [usernameField becomeFirstResponder];
    }
    else {
        usernameField.text = username;
        passwordField.text = password;
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
	if (self = [super initWithStyle:style]) {
	}
	return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell;

    if (indexPath.row == 0) {
        cell = username;
    }
    else {
        cell = password;
    }
    
    UILabel *label = (UILabel*)[cell viewWithTag:LABEL_TAG];
    label.font = [UIFont boldSystemFontOfSize:16];
    UITextField *text = (UITextField*)[cell viewWithTag:TEXTFIELD_TAG];
    text.font = [UIFont systemFontOfSize:16];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;

    if (indexPath.row == 0) {
        cell = username;
    }
    else {
        cell = password;
    }
    UITextField *text = (UITextField*)[cell viewWithTag:TEXTFIELD_TAG];
    [text becomeFirstResponder];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction) done: (id) sender
{
    [usernameField resignFirstResponder];
    [passwordField resignFirstResponder];

    [[NSUserDefaults standardUserDefaults] setObject:usernameField.text forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] setObject:passwordField.text forKey:@"password"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

- (void)textFieldDidEndEditing:(UITextField *)textField
{

}

- (void)dealloc {
	[super dealloc];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
}

- (void)viewDidDisappear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end


