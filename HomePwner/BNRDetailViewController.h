//
//  BNRDetailViewController.h
//  HomePwner
//
//  Created by Shafiq Shovo on 19/3/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class BNRItem;
@interface BNRDetailViewController : UIViewController

@property (nonatomic,strong) BNRItem *item;

@end

NS_ASSUME_NONNULL_END
