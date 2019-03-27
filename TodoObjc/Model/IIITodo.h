//
//  IIITodo.h
//  TodoObjc
//
//  Created by Ilgar Ilyasov on 3/27/19.
//  Copyright © 2019 Fun-the-mental. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIITodo : NSObject

/********************************************************
 ********************************************************
 ATOMICITY:

* Atomic = DEFAULT. Unable to be broken down into smaller.
* Ensures you get a real value, but it's slower
* You should also use atomic for thread safe objects.
* But that doesn't mean atomic is thread safe.
* You still need to do more to make it thread safe

* Nonatomic = you could get corrupted memory (garbage value)
* but it's faster
*/


/*********************************************************
 *********************************************************
 ACCESS

* Readonly = Doesn't create (synthesize) a setter for the property
* Nothing can set the value (outside of the initializer)
 
* Readwrite = DEFAULT. Able to read and write the value.

*/


/*********************************************************
 *********************************************************
 MUTABILITY - Tomorrow
 STORAGE - Tomorrow
*/

- (instancetype)initWithName:(NSString *)name
                        note:(NSString *)note dueDate:(NSDate *)dueDate;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *note;
@property (nonatomic, copy) NSDate *dueDate;

@end

NS_ASSUME_NONNULL_END
