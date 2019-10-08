//
//  AMGEntryListTableViewController.m
//  JournalObjC
//
//  Created by Austin Goetz on 10/7/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import "AMGEntryListTableViewController.h"
#import "AMGEntryController.h"
#import "AMGEntryDetailViewController.h"

@interface AMGEntryListTableViewController ()

@end

@implementation AMGEntryListTableViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[[AMGEntryController sharedController] entries] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"journalCell" forIndexPath:indexPath];
    
    AMGEntryController * entryController =[AMGEntryController sharedController];
    AMGEntry * entry = entryController.entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    return cell;
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"toViewEntry"]) {
        
        NSIndexPath * indexPath = [self.tableView indexPathForCell:sender];
        AMGEntry * entry = [AMGEntryController sharedController].entries[indexPath.row];
        
        AMGEntryDetailViewController * detailViewController = segue.destinationViewController;
        detailViewController.entry = entry;
    }
}

@end
