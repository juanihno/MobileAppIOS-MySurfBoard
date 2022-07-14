//
//  ViewController.m
//  MySurfBoardsApp
//
//  Created by juan on 16/11/21.
//  Copyright © 2021 juan. All rights reserved.
//

#import "ViewController.h"
@import Firebase;


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtRepassword;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UILabel *errorLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
// Do any additional setup after loading the view, typically from a nib.
    _db = [FIRFirestore firestore];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)GoToLogIn:(id)sender {
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc=[sb instantiateViewControllerWithIdentifier:@"ViewController_SIgn_In"];
    vc.modalTransitionStyle= UIModalTransitionStyleFlipHorizontal;
    //[self presentViewController:vc animated:YES completion:NULL];
    [self.navigationController pushViewController:vc animated:TRUE];

}
- (IBAction)GoToLogInRegistered:(id)sender {
    NSString *email=_txtEmail.text;
    NSString *password=_txtPassword.text;
    NSString*repassword=_txtRepassword.text;
    if (![password isEqualToString: repassword]){
        self->_errorLabel.text=@"Repasword doesnt match";}
        else{

    NSLog( @"Here is a repasword: '%@'", repassword );

    NSLog( @"Here is a email: '%@'", email );
    NSLog( @"Here is a password: '%@'", password );
    [[FIRAuth auth] createUserWithEmail:email
                               password:password
                             completion:^(FIRAuthDataResult * _Nullable authResult,
                                          NSError * _Nullable error) {
      // ...
        NSLog(@"Here is a error message:'%@",[error localizedDescription]);
        if (error == nil) {
            self->_errorLabel.text=[error localizedDescription];

        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc=[sb instantiateViewControllerWithIdentifier:@"ViewController_SIgn_In"];
        vc.modalTransitionStyle= UIModalTransitionStyleFlipHorizontal;
        //[self presentViewController:vc animated:YES completion:NULL];
            [self.navigationController pushViewController:vc animated:TRUE];}
        else{
            self->_errorLabel.text=[error localizedDescription];}

    }];}
    
}
    
@end
