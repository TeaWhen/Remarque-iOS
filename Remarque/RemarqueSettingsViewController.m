//
//  RemarqueSettingsViewController.m
//  Remarque
//
//  Created by AquarHEAD L. on 4/18/13.
//  Copyright (c) 2013 Team.TeaWhen. All rights reserved.
//

#import "RemarqueSettingsViewController.h"

@interface RemarqueSettingsViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameText;
@property (weak, nonatomic) IBOutlet UITextField *urlText;

@end

@implementation RemarqueSettingsViewController

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
    self.title = @"Settings";
    self.usernameText.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"RemarqueServerUsername"];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveSettings:(id)sender {
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
    [self saveSettings:nil];
    return YES;
}

@end
