//
//  IIITodo.m
//  TodoObjc
//
//  Created by Ilgar Ilyasov on 3/27/19.
//  Copyright © 2019 Fun-the-mental. All rights reserved.
//

#import "IIITodo.h"

@implementation IIITodo

- (instancetype)initWithName:(NSString *)name
                        note:(NSString *)note dueDate:(NSDate *)dueDate
{
    self = [super init];
    
    if (self) {
        _name = name;
        _note = note;
        _dueDate = dueDate;
    }
    
    return self;
}

@end
