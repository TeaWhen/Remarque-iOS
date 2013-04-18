//
//  RemarqueNotesViewController.m
//  Remarque
//
//  Created by AquarHEAD L. on 4/16/13.
//  Copyright (c) 2013 Team.TeaWhen. All rights reserved.
//

#import "RemarqueNotesViewController.h"
#import "RemarqueNotesModel.h"
#import "RemarqueSettingsViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface RemarqueNotesViewController ()
@property (strong, nonatomic) RemarqueNotesModel *remarque_notes;
@end

@implementation RemarqueNotesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (RemarqueNotesModel *)remarque_notes
{
    if (!_remarque_notes) {
        _remarque_notes = [[RemarqueNotesModel alloc] init];
    }
    return _remarque_notes;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableData) name:@"RemarqueNotesUpdated" object:nil];
    
    self.title = @"Remarque";
   
    [self refreshRemarque:nil];
    
    if (![[NSUserDefaults standardUserDefaults] URLForKey:@"RemarqueServerURL"]) {
        [[NSUserDefaults standardUserDefaults] setURL:[NSURL URLWithString:@"http://vps.teawhen.com:8123"] forKey:@"RemarqueServerURL"];
    }
    
    if (![[NSUserDefaults standardUserDefaults] stringForKey:@"RemarqueServerUsername"]) {
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"settingsUI"] animated:YES];
    }
}

- (void)reloadTableData
{
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.remarque_notes countNotes];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoteDescription" forIndexPath:indexPath];
    cell.textLabel.text = [self.remarque_notes titleOfNoteAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.remarque_notes detailOfNoteAtIndex:indexPath.row];
    
    return cell;
}

- (IBAction)refreshRemarque:(id)sender {
    [self.remarque_notes fetchNotes];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
