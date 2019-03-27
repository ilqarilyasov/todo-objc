//
//  IIITodoDetailViewController.m
//  TodoObjc
//
//  Created by Ilgar Ilyasov on 3/27/19.
//  Copyright © 2019 Fun-the-mental. All rights reserved.
//

#import "IIITodoDetailViewController.h"
#import "../Model Controller/IIITodoController.h"
#import "../Model/IIITodo.h"

@interface IIITodoDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextView *noteTextView;
@property (weak, nonatomic) IBOutlet UIDatePicker *dueDatePicker;

@end

@implementation IIITodoDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self noteTextView] setText: nil];
    [self updateViews];
}

-(void)updateViews
{
    if (!self.isViewLoaded || !self.todo) { return; }
    
    self.title = self.todo.name;
    self.nameTextField.text = self.todo.name;
    self.noteTextView.text = self.todo.note;
    self.dueDatePicker.date = self.todo.dueDate;
}

- (IBAction)save:(UIBarButtonItem *)sender {
    
    NSString *name = self.nameTextField.text;
    NSString *note = self.noteTextView.text;
    NSDate *dueDate = self.dueDatePicker.date;
    
    if (!self.todo) {
        [[self todoController] createTodoWithName:name note:note dueDate:dueDate];
    } else {
        [[self todoController] updateTodo:self.todo name:name note:note dueDate:dueDate];
    }
    
    [self.navigationController popViewControllerAnimated: YES];
}

// If you are setter
// You are responsible for setting the instance variable's value
- (void)setTodo:(IIITodo *)todo
{
    // Make sure the todo the we are trying to set is different
    // otherwise there is no point in wasting the time setting the same value
    if (todo != _todo) {
        
        // Anything in here before _todo = todo is the "willSet"
        _todo = todo;
        
        // Anything in here after _todo = todo is the "didSet"
        [self updateViews];
    }
}

@end
