//
//  NSDate+Extension.m
//  Tools
//
//  Created by Mr.Wang on 15/4/3.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)
#pragma mark - 判断时间的方法，例如
/**
 *  是否为今天
 */
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return
    (selfCmps.year == nowCmps.year) &&
    (selfCmps.month == nowCmps.month) &&
    (selfCmps.day == nowCmps.day);
}

/**
 *  是否为昨天
 */
- (BOOL)isYesterday
{
    // 2014-05-01
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    
    // 2014-04-30
    NSDate *selfDate = [self dateWithYMD];
    
    // 获得nowDate和selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day == 1;
}

- (NSDate *)dateWithYMD
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}

/**
 *  是否为今年
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year;
}
/**
 *  如果为同一天，与当前时间相差几个小时
 */
- (NSInteger)deltaHourWithNow
{
    NSDateComponents *dateComponents = [self deltaWithNow];
    return dateComponents.hour;
}
/**
 *  如果为同一天，与当前时间相差几分钟
 */
- (NSInteger)deltaMinuteWithNow
{
    NSDateComponents *dateComponents = [self deltaWithNow];
    return dateComponents.minute;
}
/**
 *  如果为同一天，与当前时间相差几秒
 */
- (NSInteger)deltaSecondWithNow
{
    NSDateComponents *dateComponents = [self deltaWithNow];
    return dateComponents.second;
}
- (NSDateComponents *)deltaWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}
#pragma mark - 时间和字符串之间转换
+(NSDate *)dateWithString:(NSString *)string FormatterString:(NSString *)FormatterString
{
    NSDateFormatter *formatter = [self getDateFormatter:FormatterString];
    NSDate *date = [formatter dateFromString:string];
    return date;
}
+(NSDateFormatter *)getDateFormatter:(NSString *)FormatterString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (FormatterString == nil) {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }else{
        [formatter setDateFormat:FormatterString];
    }
    return formatter;
}
- (NSString *)toStringWithformatterString:(NSString *)FormatterString;
{
    NSDateFormatter *formatter = [[self class] getDateFormatter:FormatterString];
    NSString *strDate = [formatter stringFromDate:self];
    return strDate;
}

/**
 获取当前时间(带毫秒)
 */
+ (NSString *)getDateTimeMS {
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss:SSS"];
    NSString *dateTime = [formatter stringFromDate:date];
    return dateTime;
}
- (NSString *)getDateTimeMS{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss:SSS"];
    NSString *dateTime = [formatter stringFromDate:self];
    return dateTime;
}
@end
