//
//  Person.m
//  ObjectC Class学习
//
//  Created by yanzi on 16/8/14.
//  Copyright © 2016年 yanzi. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)init{
    self = [super init];
    if(self){
        _name = @"李小龙";
        _age = 29;
    }
    return self;
}

-(id)initWithName:(NSString *)name AndAge:(NSInteger)age{
    self = [self init];
    self->_age = age;
    self->_name = name;
    return self;
}


-(void)setName:(NSString *)name{
    _name = name;
}
-(void)setAge:(NSInteger) age{
    _age = age;
}

-(NSString *)name{
    return _name;
}

-(NSInteger)age{
    return _age;
}

- (void)print{
    NSLog(@"name = %@, age = %li", _name, _age);
}

+(void)test{
    Person *person = [[Person alloc]initWithName:@"大爷的" AndAge:100];
    [person print];
    
}

@end
