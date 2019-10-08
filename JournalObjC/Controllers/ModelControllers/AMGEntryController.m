//
//  AMGEntryController.m
//  JournalObjC
//
//  Created by Austin Goetz on 10/7/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import "AMGEntryController.h"

static NSString * const EntriesKey = @"entries";

@interface AMGEntryController ()

@property (nonatomic, strong) NSMutableArray * internalEntries;

@end

@implementation AMGEntryController

+ (AMGEntryController *)sharedController
{
    static AMGEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [AMGEntryController new];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalEntries = [NSMutableArray array];
    }
    return self;
}

- (void)saveToPersistentStorage
{
    NSMutableArray * entryDictionaries = [NSMutableArray new];
    
    for (AMGEntry * entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
}

- (void)loadFromPersistentStorage
{
    NSArray * entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    for (NSDictionary * dictionary in entryDictionaries) {
        AMGEntry * entry = [[AMGEntry alloc] initWithDictionary:dictionary];
        [self addEntry:entry];
    }
}

- (NSArray *)entries {return self.internalEntries;}

- (void)addEntry:(AMGEntry *)entry
{
    [self.internalEntries addObject:entry];
}

- (void)removeEntry:(AMGEntry *)entry
{
    [self.internalEntries removeObject:entry];
}

@end
