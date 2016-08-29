//
//  main.m
//  ObjectC 字符串学习
//
//  Created by yanzi on 16/8/27.
//  Copyright © 2016年 yanzi. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //一.字符串比较
        //NSOrderedAscending 递增, NSOrderedSame 相等, NSOrderedDescending 递减
        NSString *str1 = [NSString stringWithFormat:@"%@", @"hello world"];
        NSString *str2 = [NSString stringWithUTF8String:"hello world"];
        NSComparisonResult result = [str1 compare:str2];
        if(result == NSOrderedAscending){
            NSLog(@"str1 小于 str2");
        }else if(result == NSOrderedSame){
            NSLog(@"str1 等于 str2");
        }else if(result == NSOrderedDescending){
            NSLog(@"str1 大于 str2");
        }
        //1.1不区分大小写进行比较
        NSComparisonResult result2 = [str1 caseInsensitiveCompare:str2];
        
        //1.2不区分大小写的另外一种写法
        NSComparisonResult result3 = [str1 compare:str2 options:NSCaseInsensitiveSearch];
        NSLog(@"result3 = %li", result3);
        
        //1.3判断两个字符串对象是否相等
        BOOL result4 = [str1 isEqualToString:str2];
        NSLog(@"result4 = %d", result4);
        //1.4字符串开头判断
        BOOL ret = NO;
        NSString *str3 = @"www.baidu.com baidu uuu";
        ret = [str3 hasPrefix:@"www"];
        NSLog(@"ret = %d", ret);
        
        //1.5字符串结尾判断
        ret = [str3 hasSuffix:@"com"];
        if(ret == YES){
            NSLog(@"%@ 以com结尾", str3);
        }
        
        /***************二,字符串拼接*************/
        NSString *str4 = @"www";
        NSString *str11 = [str4 stringByAppendingString:@".baidu.com"];
        NSLog(@"str11 = %@", str11);
        NSString *str12 = [str4 stringByAppendingFormat:@"rest%d%s", 123, "hello"];
        NSLog(@"str11 = %@", str12);
        
        /***************三,字符串提取*************/
        NSString *str13 = [str3 substringFromIndex:4]; //从起始位置截取到结束
        NSLog(@"str13 = %@", str13);
        NSLog(@"test = %@", [str3 substringToIndex:4]); //不包含指定位置
        NSLog(@"test = %@", [str3 substringWithRange:NSMakeRange(4, 3)]);//起始位置和长度
        
        /***************四,字符串查找*************/
        NSRange rage = [str3 rangeOfString:@"baidu"];
        //static const NSInteger NSNotFound = NSIntegerMax;
        if(rage.location != NSNotFound){
            NSLog(@"loc = %li, lenth = %li", rage.location, rage.length);
        }
        
        //倒序查找
        NSRange rage2 = [str3 rangeOfString:@"baidu" options:NSBackwardsSearch];
        if(rage2.location != NSNotFound){
            NSLog(@"loc = %li, lenth = %li", rage2.location, rage2.length);
        }
        
        //指定范围查找
        NSRange rage3 = [str3 rangeOfString:@"baidu" options:NSLiteralSearch range:NSMakeRange(4, 4)];
        if(rage3.location == NSNotFound){
            NSLog(@"未查到...");
        }
        
        /***************五,字符串操作*************/
        NSString *str = @"hello,World,test";
        NSLog(@"%@", [str uppercaseString]); //小写转大写
        NSLog(@"%@", [str lowercaseString]); //大写转小写
        NSLog(@"%@", [str capitalizedString]); //每个单词的小写转大写
        
        /******************六，字符串数值转换**********/
        NSString *test = @"1234";
        NSLog(@"test = %i", [test intValue]); //转int
        NSLog(@"test = %li", [test integerValue]);//转NSInteger对象
        NSLog(@"test = %.2f", [test floatValue]);
        
        
        /******************七，字符串置换**********/
        NSString *t1 = @"Hello, how are you!";
        NSString *t2 = [t1 stringByReplacingCharactersInRange:[t1 rangeOfString:@"how"] withString:@"howw"];
        //替换元字符串出现的所有目标字符串
        NSString *t3 = [t1 stringByReplacingOccurrencesOfString:@"how" withString:@"howwww"];
        NSLog(@"t3 = %@, 原始 = %@", t3, t1);
        
        /******************八，文件的输入输出**********/
        NSError *error = nil;
        NSString *tt1 = [NSString stringWithContentsOfFile:@"/Users/yanzi/Desktop/1.txt" encoding:NSUTF8StringEncoding error:&error];
        if(error){
            NSLog(@"error = %@", error);
        }else{
            NSLog(@"tt1 = %@", tt1);
        }
        
        //NSString写入文件
        NSString *tt2 = @"中国人";
        BOOL saveRet = [tt2 writeToFile:@"/Users/yanzi/Desktop/2.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
        if(saveRet){
            NSLog(@"写入成功");
        }else{
            NSLog(@"写入失败");
        }
        
        /************九，创建可变字符串*************/
        NSMutableString *mS1 = [NSMutableString stringWithUTF8String:"李小龙"];
        [mS1 appendString:@",中国人"];
        NSLog(@"mS1 = %@", mS1);
        //创建指定容量大小的可变字符串对象
        //等于@""，空字符串对象，不是nil
        NSMutableString *ms2 = [[NSMutableString alloc]initWithCapacity:20];
        
        [mS1 insertString:@"hello" atIndex:0];//增加字符串
        NSLog(@"mS1 = %@", mS1);
        [mS1 deleteCharactersInRange:NSMakeRange(0, 2)]; //删除指定范围的字符串
        NSLog(@"mS1 = %@", mS1);
        [mS1 appendString:@"成龙"];   //字符串末尾追加字符串
        NSLog(@"mS1 = %@", mS1);
        
        //重置字符串
        [mS1 setString:@"中国人民"];
        NSLog(@"mS1 = %@", mS1);
        
        //用传入的字符串替换指定范围内的字符
        [mS1 replaceCharactersInRange:NSMakeRange(0, 2) withString:@"美国"];
        NSLog(@"mS1 = %@", mS1);
        [mS1 replaceOccurrencesOfString:@"美国" withString:@"中国" options:NSLiteralSearch range:NSMakeRange(0, [mS1 length])];
        NSLog(@"mS1 = %@", mS1);
    
        
    }
    return 0;
}
