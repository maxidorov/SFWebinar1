//
//  Message.m
//  Webenar1
//
//  Created by Maxim Sidorov on 29.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

#import "Message.h"

@implementation Message

- (id)initWithText: (NSString*) initialText {
    self = [super init];
    if (self) {
        self.text = initialText;
    }
    return self;
}

- (void)readMessage {
    self.isRead = YES;
}

+ (void)print123 {
    NSLog(@"123");
}

@end
