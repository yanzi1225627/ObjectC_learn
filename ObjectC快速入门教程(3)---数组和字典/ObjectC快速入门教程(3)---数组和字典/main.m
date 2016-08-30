//
//  main.m
//  ObjectC快速入门教程(3)---数组和字典
//
//  Created by yanzi on 16/8/30.
//  Copyright © 2016年 yanzi. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *array1 = @[@"one", @"two", @"three", @"four", [NSNumber numberWithInt:123]];
        NSLog(@"array1 = %@", array1);
        
        NSArray *array2 = [[NSArray alloc]init]; //空数组
        NSArray *array22 = [NSArray array]; //也是空数组
        NSLog(@"array2 = %@", array2);
        
        NSArray *arryy3 = [[NSArray alloc]initWithObjects:@"one", @"two", nil];
        NSLog(@"array3 = %@", arryy3);
        
        NSLog(@"array1[1] = %@", [array1 objectAtIndex:1]);
        NSLog(@"array1[1] = %@", array1[1]);
        NSLog(@"cnt = %li", [array1 count]);
        
        //获取元素在数组中第一次出现的位置
        NSInteger index = [array1 indexOfObject:@"two"];
        NSLog(@"index = %li", index);
        
        NSLog(@"first = %@", [array1 firstObject]); //第一个元素
        NSLog(@"last = %@", [array1 lastObject]);   //最后一个元素
        
        //数组比较
        NSArray *array10 = @[@"one", @"two", @"three", @"four"];
        NSArray *array11 = [NSArray arrayWithObjects:@"one", @"two1", nil];
        BOOL ret = [array10 isEqualToArray:array11]; //判断两个数组是否相等
        if(ret){
            NSLog(@"两个数组相等");
        }else{
            NSLog(@"两个数组不想等");
        }
        //返回数组中第一个想等的元素
        id obj = [array10 firstObjectCommonWithArray:array11];
        NSLog(@"%@", obj);
        
        //数组排序,前提：数组中的元素是相同类型的
        NSArray *sortArray = [array10 sortedArrayUsingSelector:@selector(compare:)];//@selector大于0时进行交换
        NSLog(@"%@", sortArray);
        
        //数组添加
        NSArray *array12 = [array10 arrayByAddingObject:@"five"];
        NSLog(@"array12 = %@", array12);
        
        //提取指定范围内的数组
        NSArray *array13 = [array10 subarrayWithRange:NSMakeRange(2, 2)];
        NSLog(@"array13 = %@", array13);
        
        //NSIndexSet 下表集合类
        NSMutableIndexSet *index2 = [NSMutableIndexSet indexSetWithIndex:1];
        
        [index2 addIndex:3];
        NSArray *array14 = [array10 objectsAtIndexes:index2];
        NSLog(@"array14 = %@", array14);
        
        NSString* str = @"I :am :good :boy";
        NSArray* array15 = [str componentsSeparatedByString:@" :"];
        NSLog(@"array15 = %@", array15);
        
        NSArray *array16 = [str componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" :"]];
        NSLog(@"array16 = %@", array16);
        
        //数组元素的拼接
        NSArray *array = @[@"one", @"two", @"three"];
        NSString *arrayStr = [array componentsJoinedByString:@" "];
        NSLog(@"arrayStr = %@", arrayStr);
        
        //方法1,通过数组元素下标
        for(NSInteger i = 0; i < [array count]; i++){
//            NSLog(@"%@", [array objectAtIndex:i]);
        }
        
        //方法2，通过枚举器
        NSEnumerator *enumerator = [array reverseObjectEnumerator];
        id obj2 = nil;
        while(obj2 = [enumerator nextObject]){
//            NSLog(@"%@", obj2);
        }
        
        //方法3，快速枚举法
        for(id obj3 in array){
            NSLog(@"%@", obj3);
        }
        
        //可变数组
        NSMutableArray *marray = [[NSMutableArray alloc]initWithObjects:@"one", @"two", @"three", nil];
        [marray addObject:@"four"];
        [marray addObjectsFromArray:@[@"five", @"six"]]; //增加
        [marray insertObject:@"zero" atIndex:0];    //插入
        NSLog(@"%@", marray);
        
        [marray setArray:@[@"1", @"2"]];
        NSLog(@"%@", marray);
        [marray replaceObjectAtIndex:1 withObject:@"123"];
        NSLog(@"%@", marray);
        
        [marray exchangeObjectAtIndex:0 withObjectAtIndex:1];
        NSLog(@"%@", marray);
        
        //字典对象
        NSDictionary *dict0 = @{@"one":@"1",@"two":@"2"}; //前面是key后面是value
        NSLog(@"%@", dict0);
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"one",@"1",@"two", @"2",nil];//前面是value后面是key
        NSLog(@"%@", dict);
        
        NSMutableDictionary *dict1 = [NSMutableDictionary dictionaryWithDictionary:dict0];
        [dict1 setValue:@"4" forKey:@"four"]; //增加一个元素
        NSInteger count = [dict1 count]; //个数
        NSLog(@"%@", dict1);
        id obj33 = [dict1 objectForKey:@"one"]; //根据key得到value
        
        NSArray *keyArray = [dict1 allKeys]; //获得所有key
        NSArray *value = [dict1 allValues];  //获得所有value
        BOOL isEqual = [dict1 isEqualToDictionary:dict];
        if(isEqual){
            NSLog(@"相等");
        }else{
            NSLog(@"不相等");
        }
        
        NSLog(@"%@", value);
        
        //字典的遍历
        //方法1，枚举法
        NSEnumerator *keyEnumerator = [dict1 keyEnumerator];
        id obj44 = nil;
        while(obj44 = [keyEnumerator nextObject]){
            NSLog(@"key = %@ value = %@", obj44, [dict1 valueForKey:obj44]);
        }
        
        //方法2，快速枚举法
        for(id obj55 in dict1){
            NSLog(@"key = %@ value = %@", obj55, [dict1 objectForKey:obj55]);
        }
        
        //增加键值对
        [dict1 addEntriesFromDictionary:@{@"hello":@"hello123"}];
        
        
        
        
        
    }
    return 0;
}
