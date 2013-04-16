//
//  RemarqueNotesModel.m
//  Remarque
//
//  Created by AquarHEAD L. on 4/17/13.
//  Copyright (c) 2013 Team.TeaWhen. All rights reserved.
//

#import "RemarqueNotesModel.h"

@interface RemarqueNotesModel()
@property (strong, nonatomic) NSMutableArray *notes;
@end

@implementation RemarqueNotesModel

- (void)feedNotes:(NSArray *)notes
{
    self.notes = [NSMutableArray arrayWithArray:notes];
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
