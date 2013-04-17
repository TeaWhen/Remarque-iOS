//
//  RemarqueViewController.m
//  Remarque
//
//  Created by AquarHEAD L. on 4/16/13.
//  Copyright (c) 2013 Team.TeaWhen. All rights reserved.
//

#import "RemarqueViewController.h"
#import "RemarqueNotesViewController.h"

@interface RemarqueViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *urlText;
@property (weak, nonatomic) IBOutlet UITextField *usernameText;

@end

@implementation RemarqueViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Login";
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showNotes"]) {
        RemarqueNotesViewController *rnotesvc = (RemarqueNotesViewController *)segue.destinationViewController;
        rnotesvc.url = self.urlText.text;
        rnotesvc.username = self.usernameText.text;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self performSegueWithIdentifier:@"showNotes" sender:self];
    return YES;
}

@end
