//
//  AMGEntryController.h
//  JournalObjC
//
//  Created by Austin Goetz on 10/7/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMGEntry.h"

@interface AMGEntryController : NSObject

+ (AMGEntryController *)sharedController;

@property (nonatomic, strong, readonly) NSArray * entries;

- (void)addEntry:(AMGEntry *)entry;
- (void)removeEntry:(AMGEntry *)entry;

@end
