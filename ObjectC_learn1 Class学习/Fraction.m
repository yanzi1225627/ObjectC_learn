//
//  Fraction.m
//  ObjectC Class学习
//
//  Created by yanzi on 16/8/14.
//  Copyright © 2016年 yanzi. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

- (id)initWithFenzi:(NSInteger)fenzi andFenmu:(NSInteger)fenmu{
    self = [super init];
    if(self){
        _fenmu = fenmu;
        _fenzi = fenzi;
    }
    return self;
}

- (void)setFenmu:(NSInteger)fenmu{
    _fenmu = fenmu;
}

- (void)setFenzi:(NSInteger)fenzi{
    _fenzi = fenzi;
}

- (NSInteger)fenzi{
    return _fenzi;
}

- (NSInteger)fenmu{
    return _fenmu;
}

- (void)print{
    NSLog(@"%li / %li", _fenzi, _fenmu);
}

- (void)addFrac:(Fraction *)frac{
    _fenzi = _fenzi * [frac fenmu] + _fenmu * [frac fenzi];
    _fenmu = _fenmu * [frac fenmu];
}

- (void)subFrac:(Fraction *)frac{
    _fenzi = _fenzi*[frac fenmu] - _fenmu * [frac fenzi];
    _fenmu = _fenmu * [frac fenmu];
    
}

- (void)mulFrac:(Fraction *)frac{
    _fenzi *= [frac fenzi];
    _fenmu *= [frac fenmu];
}

- (void)divFrac:(Fraction *)frac{
    _fenzi *= [frac fenmu];
    _fenmu *= [frac fenzi];
}

- (void)reduce{
    NSInteger a = _fenzi;
    NSInteger b = _fenmu;
    while(b){
        NSInteger temp = a % b; //辗转相除法求余数, 如果a % b求余不为0，则a和b的最大公约数，等于b对temp的最大公约数
        a = b;
        b = temp;
    }
    //出上面while循环后a就是最大公约数
    _fenzi /= a;
    _fenmu /= a;
    
}


@end
