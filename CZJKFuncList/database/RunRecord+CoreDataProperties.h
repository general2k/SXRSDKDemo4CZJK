//
//  RunRecord+CoreDataProperties.h
//  CZJKFuncList
//
//  Created by qf on 16/10/10.
//  Copyright © 2016年 Keeprapid. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "RunRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface RunRecord (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *adddate;
@property (nullable, nonatomic, retain) NSNumber *closed;
@property (nullable, nonatomic, retain) NSNumber *issync;
@property (nullable, nonatomic, retain) NSString *macid;
@property (nullable, nonatomic, retain) NSNumber *pace;
@property (nullable, nonatomic, retain) NSString *running_id;
@property (nullable, nonatomic, retain) NSString *sectionIdentifier;
@property (nullable, nonatomic, retain) NSDate *starttime;
@property (nullable, nonatomic, retain) NSNumber *starttimestamp;
@property (nullable, nonatomic, retain) NSNumber *totalcalories;
@property (nullable, nonatomic, retain) NSNumber *totaldistance;
@property (nullable, nonatomic, retain) NSNumber *totalstep;
@property (nullable, nonatomic, retain) NSNumber *totaltime;
@property (nullable, nonatomic, retain) NSNumber *type;
@property (nullable, nonatomic, retain) NSString *uid;

@end

NS_ASSUME_NONNULL_END
