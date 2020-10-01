//
//  Message.m
//  Webinar2
//
//  Created by Maxim Sidorov on 01.10.2020.
//  Copyright © 2020 MS. All rights reserved.
//

#import "Message.h"

@implementation Message

- (id)init {
    self = [super init];
    NSLog(@"Message created");
    return self;
}

- (void)dealloc {
    NSLog(@"Message deallocated");
}

- (id)initWithText:(NSString *)text1
          senderId:(NSString *)senderId1
        senderTime:(NSDate *)sentTime1 {
    self = [super self];
    if (self) {
        self.text = text1;
        self.senderId = senderId1;
        self.sentTime = sentTime1;
        self.isRead = NO;
    }
    return self;
}

- (void)readMessage {
    self.isRead = YES;
}

- (NSString*) sentTimeFromNow {
    return @"";
}

- (void) editMessage:(NSString *)newText {
    self.text = newText;
}

+ (int)maximumLength {
    return 300;
}

- (void)print {
    NSLog(@"123");
}

@end
