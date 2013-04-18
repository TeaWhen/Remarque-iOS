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

- (void)fetchNotes:(NSString *)url
{
    NSURL *server_url = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:server_url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        self.notes = [JSON valueForKeyPath:@"objects"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RemarqueNotesUpdated" object:self];
    } failure:nil];
    
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
