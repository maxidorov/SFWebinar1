//
//  Message.h
//  Webenar1
//
//  Created by Maxim Sidorov on 29.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Printable <NSObject>
@optional
-(void)print;
@end

@interface Message : NSObject<Printable>

@property NSString* text;
@property BOOL isRead;

- (id)initWithText: (NSString*) initialText;
- (void)readMessage;

+(void)print123;

@end
