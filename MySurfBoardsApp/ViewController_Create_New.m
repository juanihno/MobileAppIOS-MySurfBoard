//
//  ViewController_Create_New.m
//  MySurfBoardsApp
//
//  Created by juan on 19/11/21.
//  Copyright © 2021 juan. All rights reserved.
//

#import "ViewController_Create_New.h"

@interface ViewController_Create_New ()
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtBrand;
@property (weak, nonatomic) IBOutlet UITextField *txtSize;
@property (weak, nonatomic) IBOutlet UITextView *txtDescription;
@property NSString   *score;  // intended to be globally accessible
@property (strong, nonatomic) IBOutlet UILabel *errorLabel;

@end

@implementation ViewController_Create_New

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_txtDescription setDelegate:self];
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
- (IBAction)cancelAndGoHomeMenu:(id)sender {
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc=[sb instantiateViewControllerWithIdentifier:@"ViewController_Home_Menu"];
    vc.modalTransitionStyle= UIModalTransitionStyleFlipHorizontal;
    //[self presentViewController:vc animated:YES completion:NULL];
    [self.navigationController pushViewController:vc animated:TRUE];

}
- (IBAction)addAndGoHomeMenu:(id)sender {
    NSString *brand=_txtBrand.text;
    NSString *name=_txtName.text;
    NSString *size=_txtSize.text;
    NSString *description=_txtDescription.text;
    
    if (brand==NULL || name==NULL || size==NULL || size==NULL || description== NULL|| _score==NULL ){
        _errorLabel.text=@"fill all the fields";
        NSLog(@"NSLog fill all the fields");

    }
    else{
    __block FIRDocumentReference *ref =
        [[self.db collectionWithPath:@"boards"] addDocumentWithData:@{
          @"brand": brand,
          @"name": name,
          @"size": size,
          @"score": _score,
          @"description":description


        } completion:^(NSError * _Nullable error) {
          if (error != nil) {
            NSLog(@"Error adding document: %@", error);
          } else {
            NSLog(@"Document added with ID: %@", ref.documentID);
              [[self.db collectionWithPath:@"boards"]
                  getDocumentsWithCompletion:^(FIRQuerySnapshot * _Nullable snapshot,
                                               NSError * _Nullable error) {
                    if (error != nil) {
                      NSLog(@"Error getting documents: %@", error);
                    } else {
                      for (FIRDocumentSnapshot *document in snapshot.documents) {
                        NSLog(@"%@ => %@", document.documentID, document.data);
                      }
                    }
                  }];
              UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
              UIViewController *vc=[sb instantiateViewControllerWithIdentifier:@"ViewController_Home_Menu"];
              vc.modalTransitionStyle= UIModalTransitionStyleFlipHorizontal;
              //[self presentViewController:vc animated:YES completion:NULL];
              [self.navigationController pushViewController:vc animated:TRUE];

          }
        }];}
    
}
- (IBAction)sliderChange:(id)sender {
    UISlider *slider = (UISlider *)sender;
    _score = [NSString stringWithFormat:@"%f", slider.value];

}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    [_txtDescription setText:@""];

}
@end
