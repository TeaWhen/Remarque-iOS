//
//  RemarqueSettingsViewController.m
//  Remarque
//
//  Created by AquarHEAD L. on 4/18/13.
//  Copyright (c) 2013 Team.TeaWhen. All rights reserved.
//

#import "RemarqueSettingsViewController.h"

@interface RemarqueSettingsViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *urlText;
@property (weak, nonatomic) IBOutlet UITextField *usernameText;

@end

@implementation RemarqueSettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Settings";
    self.usernameText.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"RemarqueServerUsername"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        [self saveSettings];
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        return YES;
    }
    return NO;
}

- (void)saveSettings
{
    if (self.urlText.hasText) {
        [[NSUserDefaults standardUserDefaults] setURL:[NSURL URLWithString:self.urlText.text] forKey:@"RemarqueServerURL"];
    }
    
    if (self.usernameText.hasText) {
        [[NSUserDefaults standardUserDefaults] setObject:self.usernameText.text forKey:@"RemarqueServerUsername"];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RemarqueSettingsChanged" object:self];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self saveSettings];
    return YES;
}

@end
