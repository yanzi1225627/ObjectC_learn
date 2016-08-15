//
//  Fraction.h
//  ObjectC Class学习
//
//  Created by yanzi on 16/8/14.
//  Copyright © 2016年 yanzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
{
    NSInteger _fenzi; //分子
    NSInteger _fenmu; //分母
    
}
- (id)initWithFenzi:(NSInteger)fenzi andFenmu:(NSInteger)fenmu;

//setter
- (void)setFenzi:(NSInteger)fenzi;
- (void)setFenmu:(NSInteger)fenmu;

//getter
-(NSInteger)fenzi;
-(NSInteger)fenmu;

- (void)print;

-(void)addFrac:(Fraction*)frac; //加
-(void)subFrac:(Fraction*)frac; //减
-(void)mulFrac:(Fraction*)frac; //乘
-(void)divFrac:(Fraction*)frac; //除

-(void)reduce; //约分



@end
