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


@interface EnterInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *enterTitleLabel;
@property (weak, nonatomic) IBOutlet UITextField *enterDetailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *enterPriorityLabel;
@property (weak, nonatomic) IBOutlet UIStepper *enterPriorityStepper;
@property (nonatomic) NSManagedObjectContext *context;
@property (nonatomic, weak) AppDelegate *delegate;

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

/*
 NSManagedObjectContext *context = <#Get the context#>;
 <#Managed Object Class#> *newObject = [NSEntityDescription
 insertNewObjectForEntityForName:@"<#Entity name#>"
 inManagedObjectContext:context];
 */

- (IBAction)addItem:(id)sender {
        
    ToDo *toDo = [NSEntityDescription insertNewObjectForEntityForName:@"ToDo" inManagedObjectContext:self.context];
    
    toDo.title = self.enterTitleLabel.text;
    toDo.details = self.enterDetailsLabel.text;
    toDo.priority = (int)self.enterPriorityStepper.value;
    [self.delegate saveContext];
    
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
