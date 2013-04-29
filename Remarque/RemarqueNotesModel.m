//
//  RemarqueNotesModel.m
//  Remarque
//
//  Created by AquarHEAD L. on 4/17/13.
//  Copyright (c) 2013 Team.TeaWhen. All rights reserved.
//

#import "RemarqueNotesModel.h"
#import "AFNetworking.h"

@interface RemarqueNotesModel()
@property (strong, nonatomic) NSMutableArray *notes;
@end

@implementation RemarqueNotesModel

- (id)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fetchNotes) name:@"RemarqueSettingsChanged" object:nil];
    }
    return self;
}

- (void)fetchNotes
{
    NSURL *serverURL = [[NSUserDefaults standardUserDefaults] URLForKey:@"RemarqueServerURL"];
    if ([[serverURL absoluteString] isEqual: @""]) {
        serverURL = [NSURL URLWithString:@"http://vps.teawhen.com:8123"];
    }
    
    [self.notes removeAllObjects];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RemarqueNotesUpdated" object:self];
    NSString *urlString = [NSString stringWithFormat:@"%@/api/note/?user__username=%@", serverURL, [[NSUserDefaults standardUserDefaults] stringForKey:@"RemarqueServerUsername"]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        self.notes = [NSMutableArray arrayWithArray:(NSArray *)[JSON valueForKeyPath:@"objects"]];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RemarqueNotesUpdated" object:self];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Fetch notes failed.");
    }];
    
    [operation start];
}

- (NSInteger)countNotes
{
    return [self.notes count];
}

- (NSString *)titleOfNoteAtIndex:(NSUInteger)index
{
    return [[self.notes objectAtIndex:index] valueForKeyPath:@"title"];
}

- (NSString *)detailOfNoteAtIndex:(NSUInteger)index
{
    return [[self.notes objectAtIndex:index] valueForKeyPath:@"content"];
}

@end
