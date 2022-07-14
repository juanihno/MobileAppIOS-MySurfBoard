//
//  ViewController_SIgn_In.m
//  MySurfBoardsApp
//
//  Created by juan on 19/11/21.
//  Copyright © 2021 juan. All rights reserved.
//

#import "ViewController_SIgn_In.h"
@import Firebase;


@interface ViewController_SIgn_In ()
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UILabel *errroLabel;


@end

@implementation ViewController_SIgn_In

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)GoToHomeMenu:(id)sender {

    NSLog( @"Here is a test message: '%@'", _txtUsername.text );
    NSLog( @"Here is a test message: '%@'", _txtPassword.text );

    [[FIRAuth auth] signInWithEmail:self->_txtUsername.text
                               password:self->_txtPassword.text
                             completion:^(FIRAuthDataResult * _Nullable authResult,
                                          NSError * _Nullable error) {
          // ...
        if (error == nil) {
            self->_errroLabel.text=[error localizedDescription];
            UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UIViewController *vc=[sb instantiateViewControllerWithIdentifier:@"ViewController_Home_Menu"];
            vc.modalTransitionStyle= UIModalTransitionStyleFlipHorizontal;
            //[self presentViewController:vc animated:YES completion:NULL];
            [self.navigationController pushViewController:vc animated:TRUE];}

        //NSLog(@"Here is a error message:'%@",[error localizedDescription]);
        else{
            self->_errroLabel.text=[error localizedDescription];}

    }];}
       

@end
