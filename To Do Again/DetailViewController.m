//
//  DetailViewController.m
//  To Do Again
//
//  Created by Rosalyn Kingsmill on 2016-05-25.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(ToDo*)toDoItem {
    if (_toDoItem != toDoItem) {
        _toDoItem = toDoItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.toDoItem) {
        self.detailDescriptionLabel.text = [[self.toDoItem valueForKey:@"details"] description];
        self.detailTitleLabel.text = self.toDoItem.title;
        NSString *text = [NSString stringWithFormat:@"%d", self.toDoItem.priority];
        self.detailPriorityLabel.text = text;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
