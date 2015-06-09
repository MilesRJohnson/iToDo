//
//  Items.h
//  iToDo
//
//  Created by Miles Johnson on 6/9/15.
//  Copyright (c) 2015 StarshipEnterprise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Items : NSManagedObject

@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSNumber * itemComplete;
@property (nonatomic, retain) NSDate * itemDateAssigned;
@property (nonatomic, retain) NSDate * itemDateComplete;
@property (nonatomic, retain) NSDate * dateUpdated;
@property (nonatomic, retain) NSDate * dateAssigned;
@property (nonatomic, retain) NSString * itemDescription;
@property (nonatomic, retain) NSNumber * itemImportance;

@end
