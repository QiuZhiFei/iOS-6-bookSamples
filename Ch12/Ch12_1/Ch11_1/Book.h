//
//  Book.h
//  Ch12_1
//
//  Created by Ho Mark on 12/4/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Book : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * detail;
@property (nonatomic, retain) NSString * book_photo;
@property (nonatomic, retain) NSNumber * category;

@end
