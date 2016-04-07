//
//  ViewController.m
//  MyTest
//
//  Created by ruchin somal on 07/04/16.
//  Copyright © 2016 ruchin somal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)submitButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)submitButton:(id)sender {
    if (self.usernameTextField.text!=nil && self.passwordTextField.text!=nil && ![self.usernameTextField.text isEqualToString:@""] &&![self.passwordTextField.text isEqualToString:@""])
    {
        if ([self.usernameTextField.text isEqualToString:@"ruchin.somal"] &&[self.passwordTextField.text isEqualToString:@"9958252478"]) {
            NSString *username = self.usernameTextField.text;
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:username forKey:@"username"];
            [self performSegueWithIdentifier:@"mainSegue" sender:self];
        } else {
                [self showAlertView:@"Username or Password is incorrect"];
        }
    } else
    {
        [self showAlertView:@"Username or Password is empty"];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)showAlertView:(NSString *)message
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Error"
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okButton = [UIAlertAction
                                actionWithTitle:@"Ok"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    //Handel ok button action here
                                    
                                    
                                }];
    
    [alert addAction:okButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
