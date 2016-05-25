//
//  DetailViewController.h
//  To Do Again
//
//  Created by Rosalyn Kingsmill on 2016-05-25.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) ToDo *toDoItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailPriorityLabel;

@end

