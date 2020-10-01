//
//  Message.h
//  Webinar2
//
//  Created by Maxim Sidorov on 01.10.2020.
//  Copyright © 2020 MS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Protocols.m"

@interface Message : NSObject<Printable>

@property (weak) User* sender;

@property NSString* text;
@property NSString* senderId;
@property NSDate* sentTime;
@property BOOL isRead;

- (id)initWithText: (NSString* )text1
          senderId: (NSString*) senderId1
        senderTime: (NSDate*) sentTime1;

- (void)readMessage;
- (NSString *) sentTimeFromNow;
- (void) editMessage: (NSString*) newText;
+ (int)maximumLength;

@end
