//
//  AMGEntryDetailViewController.m
//  JournalObjC
//
//  Created by Austin Goetz on 10/7/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import "AMGEntryDetailViewController.h"
#import "AMGEntryController.h"

@interface AMGEntryDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *textViewField;

@end

@implementation AMGEntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}


- (void)updateViews
{
    if (!self.entry) return;
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    
    if (self.entry) {
        
        self.entry.title = self.titleTextField.text;
        self.entry.text = self.textViewField.text;
        self.entry.timestamp = [NSDate date];
        
    } else {
        
        AMGEntry * entry = [[AMGEntry alloc] initWithTitle:self.titleTextField.text timestamp:[NSDate date] text:self.textViewField.text];
        [[AMGEntryController sharedController] addEntry:entry];
        
        self.entry = entry;
    }
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clearButtonTapped:(UIButton *)sender {
    self.titleTextField.text = @"";
    self.textViewField.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)setEntry:(AMGEntry *)entry
{
    if (entry != _entry) {
        _entry = entry;
        [self updateViews];
    }
}

@end
