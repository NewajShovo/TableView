//
//  BNRDetailViewController.m
//  HomePwner
//
//  Created by Shafiq Shovo on 19/3/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"
#import "BNRImageStore.h"

@interface BNRDetailViewController ()
<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *NameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

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
    NSString *imageKey = item.itemKey;
    
    UIImage *imageToDisplay = [ [ BNRImageStore sharedStore] imageForKey:imageKey];
    
    self.imageView.image = imageToDisplay;
  
    
    
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





- (IBAction)takePicture:(id)sender {

    UIImagePickerController *imagePicker = [ [ UIImagePickerController alloc] init];
    if( [ UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]
       )
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else{
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePicker.delegate = self;
    [ self presentViewController: imagePicker animated:YES completion: nil];

}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info
{
    UIImage *image = info [ UIImagePickerControllerOriginalImage ];
    
    [ [ BNRImageStore sharedStore] setImage:image forKey:self.item.itemKey];
    
    
    
    self.imageView.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)backgroundTapped:(id)sender {

    [ self. view endEditing:YES];
}


@end
