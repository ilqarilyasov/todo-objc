//
//  IIITodosTableViewController.m
//  TodoObjc
//
//  Created by Ilgar Ilyasov on 3/27/19.
//  Copyright © 2019 Fun-the-mental. All rights reserved.
//

#import "IIITodosTableViewController.h"
#import "../Model Controller/IIITodoController.h"
#import "../Model/IIITodo.h"
#import "../View Controllers/IIITodoDetailViewController.h"

@interface IIITodosTableViewController ()

@property (nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation IIITodosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self todoController] todos] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];
    
    IIITodo *todo = [[[self todoController] todos] objectAtIndex: indexPath.row];
    
    cell.textLabel.text = todo.name;
    cell.detailTextLabel.text = [self.dateFormatter stringFromDate:todo.dueDate];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        IIITodo *todo = self.todoController.todos[indexPath.row];
        [self.todoController removeTodo:todo];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    [tableView reloadData];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString: @"ShowTaskDetail"]) {
        IIITodoDetailViewController *detailVC = [segue destinationViewController];
        [detailVC setTodoController: [self todoController]];
        
        NSIndexPath *index = [[self tableView] indexPathForSelectedRow];
        detailVC.todo = self.todoController.todos[index.row];
    } else if ([segue.identifier isEqualToString: @"ShowCreateTask"]) {
        
        IIITodoDetailViewController *detailVC = [segue destinationViewController];
        [detailVC setTodoController: [self todoController]];
    }
}

// Create a getter and setter for the todo controller;
@synthesize todoController = _todoController;

// Then we can use the getter
- (IIITodoController *)todoController
{
    // You should only use _ in initializer and getter
    if (!_todoController) {
        _todoController = [[IIITodoController alloc] init];
    }
    return _todoController;
}

@synthesize dateFormatter = _dateFormatter;

- (NSDateFormatter *)dateFormatter
{
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.timeStyle = NSDateFormatterShortStyle;
        _dateFormatter.dateStyle = NSDateFormatterShortStyle;
    }
    return _dateFormatter;
}

@end
