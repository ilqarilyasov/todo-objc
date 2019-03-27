//
//  IIITodoController.m
//  TodoObjc
//
//  Created by Ilgar Ilyasov on 3/27/19.
//  Copyright © 2019 Fun-the-mental. All rights reserved.
//

#import "IIITodoController.h"
#import "../Model/IIITodo.h"

#pragma mark - Extensions

// Extensions are "anonymous categories".
// They serve the same purpose as extension in Swift

// Categories are generally used to "extend" classes you don't own.

@interface IIITodoController (JSONConvertible)
@end

@implementation IIITodoController (JSONConvertible)
@end


// This is an anonymous category. You don't need an extra implementation
// You can use the main implementation part
@interface IIITodoController()

// This is the "private" and the "real" todos array
@property (nonatomic, strong) NSMutableArray *internalTodos;

@end


#pragma mark - Implementations

@implementation IIITodoController

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Create a space in the memory before using any property
        _internalTodos = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createTodoWithName:(NSString *)name note:(NSString *)note
                   dueDate:(NSDate *)dueDate
{
    IIITodo *todo = [[IIITodo alloc] initWithName:name note:note dueDate:dueDate];
    [[self internalTodos] addObject: todo];
}

- (void)updateTodo:(IIITodo *)todo name:(NSString *)name
              note:(NSString *)note dueDate:(NSDate *)dueDate
{
    todo.name = name;
    todo.note = note;
    todo.dueDate = dueDate;
}

- (void)removeTodo:(IIITodo *)todo
{
    [[self internalTodos] removeObject: todo];
}

// This is the getter like "computed property" in Swift
// Whenever anything accesses tasks, this method get called to retrieve its value
- (NSArray *)todos
{
    return [self internalTodos];
}

@end
