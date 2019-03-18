//
//  BNRItemsViewController.m
//  HomePwner
//
//  Created by Shafiq Shovo on 18/3/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"
#import <UIKit/UIKit.h>

@implementation BNRItemsViewController

- (void) viewDidLoad

{
    [ super viewDidLoad];
    [self.tableView registerClass:[ UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}
- (instancetype) init
{
    self = [ super initWithStyle: UITableViewStylePlain];
    
    if (self)
    {
        for ( int i = 0; i < 5; i++)
        {
            [ [ BNRItemStore sharedStore] createItem];
        }
    }
    
    return self;

}

- (instancetype) inintWithStyle: (UITableViewStyle) style
{
    return [ self init];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ [ [ BNRItemStore sharedStore] allItems]count];
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [ [ UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    UITableViewCell *cell =[ tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
 
    NSArray *items = [ [ BNRItemStore sharedStore] allItems];
    BNRItem *item = items [ indexPath.row];
    //cell.te
    cell.textLabel.text = [ item description];
    return cell;
}


@end
