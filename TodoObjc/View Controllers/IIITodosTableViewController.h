//
//  IIITodosTableViewController.h
//  TodoObjc
//
//  Created by Ilgar Ilyasov on 3/27/19.
//  Copyright © 2019 Fun-the-mental. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IIITodoController;

NS_ASSUME_NONNULL_BEGIN

@interface IIITodosTableViewController : UITableViewController

@property (nonatomic, strong) IIITodoController *todoController;

@end

NS_ASSUME_NONNULL_END
