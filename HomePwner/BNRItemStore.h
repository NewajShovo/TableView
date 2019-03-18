//
//  BNRItemStore.h
//  HomePwner
//
//  Created by Shafiq Shovo on 18/3/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;
+ (instancetype) sharedStore;
- (BNRItem *) createItem;

@end

NS_ASSUME_NONNULL_END
