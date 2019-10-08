//
//  AMGEntry.m
//  JournalObjC
//
//  Created by Austin Goetz on 10/7/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import "AMGEntry.h"

static NSString * const TitleKey = @"title";
static NSString * const TextKey = @"text";
static NSString * const TimestampKey = @"timestamp";

@implementation AMGEntry

- (instancetype)initWithTitle:(NSString *)title timestamp:(NSDate *)timestamp text:(NSString *)text
{
    self = [super init];
    
    if (self)
    {
        _timestamp = timestamp;
        _title = title;
        _text = text;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString * title = dictionary[TitleKey];
    NSString * text = dictionary[TextKey];
    NSDate * timestamp = dictionary[TimestampKey];
    return [self initWithTitle:title timestamp:timestamp text:text];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{TitleKey: self.title,
             TextKey: self.text,
             TimestampKey: self.timestamp};
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[AMGEntry class]]) {return NO;}
    
    return [[self dictionaryRepresentation] isEqualToDictionary:[(AMGEntry *)object
                                                                 dictionaryRepresentation]];
}

@end
