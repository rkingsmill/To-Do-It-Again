//
//  TaskViewController.m
//  To Do Again
//
//  Created by Rosalyn Kingsmill on 2016-05-25.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "TaskViewController.h"

@interface TaskViewController ()



@end

@implementation TaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    self.usernameTextfield.text = [prefs objectForKey:@"userName"];
    
    self.passwordTextfield.text = [prefs objectForKey:@"password"];

    }

    // Do any additional setup after loading the view.

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveData:(id)sender {
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];

    if ([self.saveSwitch isOn]) {
        [prefs setObject:self.usernameTextfield.text forKey:@"userName"];
        [prefs setObject:self.passwordTextfield.text forKey:@"password"];
    }
    
    else {
        
        [prefs removeObjectForKey:@"userName"];
        [prefs removeObjectForKey:@"password"];
    }
            [prefs synchronize];
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
