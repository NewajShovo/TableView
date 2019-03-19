//
//  BNRDetailViewController.m
//  HomePwner
//
//  Created by Shafiq Shovo on 19/3/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"

@interface BNRDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *NameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation BNRDetailViewController

- (void) viewWillAppear:(BOOL)animated
{
    [ super viewWillAppear:animated];
    BNRItem *item = self.item;
    
    self.NameField.text = item.itemName;
    self.serialNumberField.text = item.serialNumber;
    self.valueField.text = [ NSString stringWithFormat:@"%d", item.valueInDollars];
    
    static NSDateFormatter *dateFormatter = nil;
    
    
        dateFormatter = [ [ NSDateFormatter alloc] init];
        
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
        self.dateLabel.text = [ dateFormatter stringFromDate:item.dateCreated];
  
    
    
}
- (void) viewWillDisappear:(BOOL)animated
{
    [ super viewWillDisappear:animated];
    [self.view endEditing:YES];
    BNRItem *item = self.item;
    item.itemName = self.NameField.text;
    item.serialNumber = self.serialNumberField.text;
    item.valueInDollars = [ self.valueField.text intValue];
    ///item.dateCreated =  [ NSDateFormatter stringFromDate:item.dateCreated];
}

- (void) setItem:(BNRItem *)item
{
    _item =item;
    self.navigationItem.title = _item.itemName;
}


@end
