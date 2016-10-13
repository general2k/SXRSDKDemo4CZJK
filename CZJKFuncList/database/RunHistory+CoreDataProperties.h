//
//  RunHistory+CoreDataProperties.h
//  CZJKFuncList
//
//  Created by qf on 16/10/10.
//  Copyright © 2016年 Keeprapid. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "RunHistory.h"

NS_ASSUME_NONNULL_BEGIN

@interface RunHistory (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *adddate;
@property (nullable, nonatomic, retain) NSNumber *addtimestamp;
@property (nullable, nonatomic, retain) NSNumber *altitude;
@property (nullable, nonatomic, retain) NSNumber *direction;
@property (nullable, nonatomic, retain) NSNumber *issync;
@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *locType;
@property (nullable, nonatomic, retain) NSNumber *longitude;
@property (nullable, nonatomic, retain) NSString *macid;
@property (nullable, nonatomic, retain) NSNumber *radius;
@property (nullable, nonatomic, retain) NSString *running_id;
@property (nullable, nonatomic, retain) NSNumber *satellite_number;
@property (nullable, nonatomic, retain) NSNumber *speed;
@property (nullable, nonatomic, retain) NSString *uid;

@end

NS_ASSUME_NONNULL_END
