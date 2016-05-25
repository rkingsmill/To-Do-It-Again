//
//  EnterInfoViewController.m
//  To Do Again
//
//  Created by Rosalyn Kingsmill on 2016-05-25.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "EnterInfoViewController.h"
#import "ToDo.h"
@import CoreData;
#import "AppDelegate.h"
#import "DetailViewController.h"


@interface EnterInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *enterTitleLabel;
@property (weak, nonatomic) IBOutlet UITextField *enterDetailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *enterPriorityLabel;
@property (weak, nonatomic) IBOutlet UIStepper *enterPriorityStepper;
@property (nonatomic) NSManagedObjectContext *context;
@property (nonatomic, weak) AppDelegate *delegate;
@property (nonatomic, weak) ToDo *toDo;

@end

@implementation EnterInfoViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = [[UIApplication sharedApplication] delegate];
    self.context = self.delegate.managedObjectContext;
}
- (IBAction)setPriority:(id)sender {
    int stepper = (int)self.enterPriorityStepper.value;
    NSString *displayPriority = [NSString stringWithFormat:@"%i", stepper];
    self.enterPriorityLabel.text = displayPriority;
}

- (IBAction)addItem:(id)sender {
        
    self.toDo = [NSEntityDescription insertNewObjectForEntityForName:@"ToDo" inManagedObjectContext:self.context];
    
    self.toDo.title = self.enterTitleLabel.text;
    self.toDo.details = self.enterDetailsLabel.text;
    self.toDo.priority = (int)self.enterPriorityStepper.value;
    [self.delegate saveContext];
    
//    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"newDetails"]) {
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:self.toDo];

    }
}


@end
