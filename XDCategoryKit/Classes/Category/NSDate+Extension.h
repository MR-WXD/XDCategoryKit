//
//  NSDate+Extension.h
//  Tools
//
//  Created by Mr.Wang on 15/4/3.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

#pragma mark - 判断时间的方法，例如
/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;
/**
 *  如果为同一天，与当前时间相差几个小时
 */
- (NSInteger)deltaHourWithNow;
/**
 *  如果为同一天，与当前时间相差几分钟
 */
- (NSInteger)deltaMinuteWithNow;
/**
 *  如果为同一天，与当前时间相差几秒
 */
- (NSInteger)deltaSecondWithNow;

- (NSDateComponents *)deltaWithNow;
#pragma mark - 根据NSString得到一个NDdate
/**
 *  根据string获得一个NSdate。FormatterString传nil，默认为yyyy-MM-dd HH:mm:ss
 */
+ (NSDate *)dateWithString:(NSString *)string FormatterString:(NSString *)FormatterString;

/**
 *  根据NSdate获得一个NSString。FormatterString传nil，默认为yyyy-MM-dd HH:mm:ss
 */
- (NSString *)toStringWithformatterString:(NSString *)FormatterString;

/**
 获取当前时间(带毫秒)
 */
+ (NSString *)getDateTimeMS;
- (NSString *)getDateTimeMS;
@end
