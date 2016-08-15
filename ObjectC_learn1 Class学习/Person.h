//
//  Person.h
//  ObjectC Class学习
//
//  Created by yanzi on 16/8/14.
//  Copyright © 2016年 yanzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_name;
    NSInteger _age;
}
-(id)init;
-(id)initWithName:(NSString *)name AndAge:(NSInteger) age;

//setter方法
-(void)setName:(NSString *)name;
-(void)setAge:(NSInteger) age;

//getter方法
-(NSString *)name;
-(NSInteger)age;

-(void)print;

+(void)test;



@end
