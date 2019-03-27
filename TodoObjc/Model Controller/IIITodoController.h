//
//  IIITodoController.h
//  TodoObjc
//
//  Created by Ilgar Ilyasov on 3/27/19.
//  Copyright © 2019 Fun-the-mental. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IIITodo;

NS_ASSUME_NONNULL_BEGIN

@interface IIITodoController : NSObject

- (void)createTodoWithName:(NSString *)name note:(NSString *)note
                   dueDate:(NSDate *)dueDate;

- (void)updateTodo:(IIITodo *)todo name:(NSString *)name
              note:(NSString *)note dueDate:(NSDate *)dueDate;

- (void)removeTodo:(IIITodo *)todo;

// How do we enforece MVC by only letting the task controller change this array?
// If the property is readonly we can't change it, so how do we add & remove todos?

// The "public" todos array, a mirror image of internalTodos.
@property (nonatomic, readonly) NSArray *todos;

@end

NS_ASSUME_NONNULL_END
