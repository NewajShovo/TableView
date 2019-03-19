//
//  BNRItemsViewController.m
//  HomePwner
//
//  Created by Shafiq Shovo on 18/3/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRDetailViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"
#import <UIKit/UIKit.h>

@interface BNRItemsViewController ()

@property (nonatomic,strong) IBOutlet UIView *headerView;

@end


@implementation BNRItemsViewController

- (void) viewDidLoad

{
   [ super viewDidLoad];
    [self.tableView registerClass:[ UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}
- (instancetype) init
{
    self = [ super initWithStyle: UITableViewStylePlain];
    
    if (self)
    {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Homepwner";
        
        UIBarButtonItem *bbi = [ [ UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector (addNewItem:)];
        navItem.rightBarButtonItem = bbi;
        navItem.leftBarButtonItem = self.editButtonItem;
    }
    
    return self;

}

/*- (UIView *) headerView
{
    if (!_headerView)
    {
        [[ NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    return _headerView;
}
 */

- (IBAction) addNewItem:(id)sender
{
    //NSInteger lastRow = [ self.tableView numberOfRowsInSection:0];
    BNRItem *newItem = [ [ BNRItemStore sharedStore] createItem];
    NSInteger lastRow = [ [ [ BNRItemStore sharedStore]allItems]indexOfObject:newItem];
    NSIndexPath *indexPath = [ NSIndexPath indexPathForRow:lastRow inSection:0];
    [ self.tableView insertRowsAtIndexPaths:@[ indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

- (IBAction) toggleEditingMode:(id)sender
{
    if (self.isEditing)
    {
        [ sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    }
    else{
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
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
- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSArray *items = [ [ BNRItemStore sharedStore] allItems];
        BNRItem *item = items[ indexPath.row];
        [ [ BNRItemStore sharedStore] removeItem:item];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(nonnull NSIndexPath *)sourceIndexPath toIndexPath:(nonnull NSIndexPath *)destinationIndexPath
{
    [ [ BNRItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNRDetailViewController *detailViewController = [ [ BNRDetailViewController alloc] init];
    
    NSArray *items = [ [ BNRItemStore sharedStore] allItems];
    BNRItem *selectedItem = items [ indexPath.row];
    
    detailViewController.item = selectedItem;
    [ self.navigationController pushViewController:detailViewController animated:YES];
    
}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


@end
