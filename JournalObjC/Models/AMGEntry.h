//
//  AMGEntry.h
//  JournalObjC
//
//  Created by Austin Goetz on 10/7/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMGEntry : NSObject

@property (nonatomic, strong) NSDate * timestamp;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * text;

- (instancetype)initWithTitle:(NSString *)title
                    timestamp:(NSDate *)timestamp
                         text:(NSString *)text;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;

@end
