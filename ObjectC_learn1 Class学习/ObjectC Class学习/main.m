//
//  main.m
//  ObjectC Class学习
//
//  Created by yanzi on 16/8/14.
//  Copyright © 2016年 yanzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Fraction.h"

int main(int argc, const char * argv[]) {
@autoreleasepool {
    // insert code here...
    NSLog(@"Hello, World!");
//        Person *p = [[Person alloc]initWithName:@"yanzi" AndAge:12];
//        [p print];
//        [Person test];
    
    Fraction* frac1 = [[Fraction alloc]initWithFenzi:2 andFenmu:3];
    Fraction* frac2 = [[Fraction alloc]initWithFenzi:1 andFenmu:4];
    [frac1 print];
//    [frac1 addFrac:frac2]; // 加法测试
//    [frac1 subFrac:frac2];//减法测试
//    [frac1 mulFrac:frac2];//乘法测试
//    [frac1 divFrac:frac2];  //除法测试
    [frac1 mulFrac:frac2];  //约分测试
    [frac1 reduce];
    [frac1 print];
}
return 0;
}
