//
//  main.m
//  Webenar1
//
//  Created by Maxim Sidorov on 29.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"

/*
 
 возвращаемое_значение имя_функции (параметры) {
    return переменная
 }
 
 */

int summ(int a, int b) {
    return a + b;
}

void printHello() {
    int a = 1;
    
    NSLog(@"Hello");
}

int main(int argc, const char * argv[]) {
    
    // MARK: Переменные
    
    // Переменные
    
    /*
     
     тип имя = начальное значение;
     тип имя;
     
     скалярные
     int, double, float, BOOL
     int - %d
     double, float - %f
     
     объекты - %@
     NSDate*, NSString*
     
     */    
    int a = 1;
    int b;
    
    a = 2;
    
    double num1 = 1.2323223232323;
    float num2 = 1.2323223232323;
    
    BOOL b2 = YES;
    b2 = NO;
    
    NSString* str = @"text";
    
    NSNumber* number = @1.23;
    NSLog(@"%f", number.floatValue);
    
    NSLog(@"a = %d,num1 = %f,str = %@,number = %@", a, num1, str, number);
    
    
    double num3 = 2.5;
    int num4 = 5;
    NSLog(@"%d", num4 / 2);
    
    int sum;
    int n1 = 3;
    int n2 = 5;
    sum = summ(n1, n2);
        
    // MARK: Классы
    
    Message* msg = [[Message alloc] init];
    msg.text = @"hello";
    NSString* sf = @"SkillFactory";
    msg.text = [NSString stringWithFormat:@"%@ %@", @"hello", @"SkillFactory"];
    [msg readMessage];
    NSLog(@"text = %@, isRead = %d", msg.text, msg.isRead);
    
    Message* msg2 = [[Message alloc] initWithText:@"Hello"];
    NSLog(@"%@", msg2.text);
    
    // MARK: Дата

    NSDate* date = [NSDate now];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy.MM.dd"];
    NSDate* dateFromString = [dateFormatter dateFromString:@"2000.01.17"];
    
    double secondsFrom1970 = dateFromString.timeIntervalSince1970;
    
    [Message print123];
    
    // MARK: Ошибки
    
    NSArray* arr = @[@1, @2];
    NSNumber* num;
    @try {
        num = arr[2];
    } @catch (NSException* exception) {
        num = arr[0];
        NSLog([exception name]);
    }
    
    NSLog(@"%@", num);
    int num6 = num.intValue * 2;
    NSLog(@"%d", num6);
    
    return 0;
}
