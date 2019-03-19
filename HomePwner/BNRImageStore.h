//
//  BNRImageStore.h
//  HomePwner
//
//  Created by Shafiq Shovo on 19/3/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRImageStore : NSObject
+ (instancetype) sharedStore;
- (void) setImage: (UIImage *) image forKey: (NSString *) key;
- (UIImage *) imageForKey: (NSString *) key;
- (void) deleteImageForKey: (NSString *) key;
@end

NS_ASSUME_NONNULL_END
