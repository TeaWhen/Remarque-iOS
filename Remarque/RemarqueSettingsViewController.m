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
    
    self.urlText.text = [[NSUserDefaults standardUserDefaults] URLForKey:@"RemarqueServerURL"].absoluteString;
    self.usernameText.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"RemarqueServerUsername"];
}

- (IBAction)editingDidEnd:(UITextField *)sender {
    [self saveSettings];
}

- (void)saveSettings
{
    [[NSUserDefaults standardUserDefaults] setURL:[NSURL URLWithString:self.urlText.text] forKey:@"RemarqueServerURL"];
    [[NSUserDefaults standardUserDefaults] setObject:self.usernameText.text forKey:@"RemarqueServerUsername"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RemarqueSettingsChanged" object:self];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
