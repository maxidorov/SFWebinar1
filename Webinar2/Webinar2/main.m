//
//  main.m
//  Webinar2
//
//  Created by Maxim Sidorov on 01.10.2020.
//  Copyright © 2020 MS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"
#import "User.h"
#import "VoiceMessage.h"

void sayHello();
void printNumber(int);
int sumNumbers(int, int);

int main(int argc, const char * argv[]) {
    
    sayHello();
    printNumber(10);
    printNumber(100);
    
    int sum = sumNumbers(10, 20);
    printNumber(sum);
    
    
    Message* message = [[Message alloc] init];
//    Message* message2 = [[Message alloc] initWithText:@"abc" senderId:@"123" senderTime:[NSDate now]];
    
    User* user = [[User alloc] init];
    
    user.messages = [[NSMutableArray alloc] initWithArray:[NSArray arrayWithObjects:message, nil]];
    message.sender = user;
    
    VoiceMessage* voiceMessage = [[VoiceMessage alloc] init];
    NSLog(@"%d", voiceMessage.length);
    
    return 0;
}

void sayHello() {
    NSLog(@"Hello");
}

void printNumber(int num) {
    NSLog(@"%d", num);
}

int sumNumbers(int a, int b) {
    int sum = a + b;
    return sum;
}
