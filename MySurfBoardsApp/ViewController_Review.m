//
//  ViewController_Review.m
//  MySurfBoardsApp
//
//  Created by juan on 19/11/21.
//  Copyright © 2021 juan. All rights reserved.
//

#import "ViewController_Review.h"

@interface ViewController_Review ()
@property (strong, nonatomic) IBOutlet UITextField *txtBrand;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextView *txtDescription;

@end

@implementation ViewController_Review

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    //self.txtBrand.text=_boardBrand;
    _txtName.text=_boardName;
    _txtBrand.text=_boardBrand;
    _txtDescription.text=_boardDescription;
    //_txtSize.text= _boardSize;
   // _boardScore=_txtScore.text;
//    self.txtName.text=_boardName;
//    self.txtBrand.text=_boardBrand;
//    self.txtDescription.text=_boardDescription;
    //self.txtSize.text= _boardSize;

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
- (IBAction)RateAndBackHomme:(id)sender {
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc=[sb instantiateViewControllerWithIdentifier:@"ViewController_Home_Menu"];
    vc.modalTransitionStyle= UIModalTransitionStyleFlipHorizontal;
    //[self presentViewController:vc animated:YES completion:NULL];
    [self.navigationController pushViewController:vc animated:TRUE];
}

@end
