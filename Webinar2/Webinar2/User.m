//
//  User.m
//  Webinar2
//
//  Created by Maxim Sidorov on 01.10.2020.
//  Copyright © 2020 MS. All rights reserved.
//

#import "User.h"

@implementation User

- (id)init {
    self = [super init];
    NSLog(@"User created");
    return self;
}

- (void)dealloc {
    NSLog(@"User deallocated");
}

@end
