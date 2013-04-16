//
//  RemarqueNotesModel.h
//  Remarque
//
//  Created by AquarHEAD L. on 4/17/13.
//  Copyright (c) 2013 Team.TeaWhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RemarqueNotesModel : NSObject

//- (void)fetchNotes;
- (void)feedNotes:(NSArray *)notes;
- (NSInteger)countNotes;
- (NSString *)titleOfNoteAtIndex:(NSUInteger)index;
- (NSString *)detailOfNoteAtIndex:(NSUInteger)index;

@end
