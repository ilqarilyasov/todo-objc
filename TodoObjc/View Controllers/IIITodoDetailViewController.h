//
//  IIITodoDetailViewController.h
//  TodoObjc
//
//  Created by Ilgar Ilyasov on 3/27/19.
//  Copyright © 2019 Fun-the-mental. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IIITodo;
@class IIITodoController;
NS_ASSUME_NONNULL_BEGIN

@interface IIITodoDetailViewController : UIViewController

// both properties are going to get their values from the prepareForSegue
@property (nonatomic, strong) IIITodoController *todoController;
@property (nonatomic, strong) IIITodo *todo;

@end

NS_ASSUME_NONNULL_END
